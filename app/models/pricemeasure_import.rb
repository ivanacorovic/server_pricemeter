class PricemeasureImport
  # switch to ActiveModel::Model in Rails 4
  extend ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  # def save
  #   if imported_pricemeasures.map(&:valid?).all?
  #     imported_pricemeasures.each(&:save!)
  #     true
  #   else
  #     imported_pricemeasures.each_with_index do |pricemeasure, index|
  #       pricemeasure.errors.full_messages.each do |message|
  #         errors.add :base, "Row #{index+2}: #{message}"
  #       end
  #     end
  #     false
  #   end
  # end

  # def imported_pricemeasures
  #   @imported_pricemeasures ||= load_imported_pricemeasures
  # end

  def parse_spreadsheet 
    result = []
    spreadsheet = open_spreadsheet
    if !spreadsheet.empty?(1, 1)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        result << Hash[[header, spreadsheet.row(i)].transpose]
      end
    end
    result
  end
  
  # def load_imported_pricemeasures
  #   result = []
  #   spreadsheet = open_spreadsheet
   
  
  #   if !spreadsheet.empty?(1, 1)
  # 	 header = spreadsheet.row(1)
  #    #rowarray << header
  # 	  (2..spreadsheet.last_row).each do |i|
  # 	    row = Hash[[header, spreadsheet.row(i)].transpose]
        
  # 	    pricemeasure = Pricemeasure.find_by_id(row["id"]) || Pricemeasure.new

  #       if !Product.find_by(bar_code: row["bar_code"].to_s).nil?
  #         pricemeasure.product_id = Product.find_by(bar_code: row["bar_code"].to_s).id
  #       end
  #       if !Supermarket.find_by(name: row["supermarket"].to_s).nil?
  #         pricemeasure.supermarket_id = Supermarket.find_by(name: row["supermarket"]).id
  #       end
  # 	    pricemeasure.price = row["price"]
  # 	    pricemeasure.discount = row["discount"]
  # 	    pricemeasure.measured_at = row["measured_at"]
  #       result << pricemeasure
	 #    end
  #   end
  #   result 
  # end

 	def open_spreadsheet
	  case File.extname(file.original_filename)
		  when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore) 
		  when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      when ".csv" then Roo::CSV.new(file.path, file_warning: :ignore)
      when ".ods" then Roo::LibreOffice.new(file.path,file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
	  end
	end

end