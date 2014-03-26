class Pricemeasure < ActiveRecord::Base

	before_save :remove_prev_discount

	belongs_to :product
	belongs_to :supermarket
	validates :product, presence: true
	validates :supermarket, presence: true
	scope :descending, -> {order('measured_at DESC')}

	def self.total(prices)
		@total=prices.sum('price')
	end



	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    pricemeasure = find_by_id(row["id"]) || new
	    #pricemeasure.attributes = row.to_hash.slice(*accessible_attributes)
	    pricemeasure.product_id = Product.find_by(bar_code: row["bar_code"].to_s).id
	    pricemeasure.supermarket_id = row["supermarket"]
	    pricemeasure.price = row["price"]
	    pricemeasure.discount = row["discount"]
	    pricemeasure.measured_at = row["measured_at"]
	    pricemeasure.save!
	  end
	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename, :ignore)
	  when ".csv" then Roo::CSV.new(file.path, :ignore)
	  when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
	  when ".xlsx" then Roo::Excelx.new(file.path, :ignore)
	  when ".ods" then Roo::LibreOffice.new(file.path, :ignore)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end


	def self.get_products_on_sale(market)
		where(supermarket_id: market.id, discount: true, measured_at: 2.week.ago..DateTime.now)
	end

	private
	
	def remove_prev_discount
		if self.discount == true
			prices=Pricemeasure.where(product_id: self.product_id, 
			 supermarket_id: self.supermarket_id, discount: true)
			if prices
					prices.update_all(discount: false)
			end
		end
	end

	

end
