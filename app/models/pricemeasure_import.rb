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


  def parse_spreadsheet(supermarket_id)
    result = []
    spreadsheet = open_spreadsheet
    if !spreadsheet.empty?(1, 1)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        temp = Hash[[header, spreadsheet.row(i)].transpose]
        pm = Pricemeasure.new
        pm.bar_code = temp["bar_code"]
        pm.supermarket_id = supermarket_id
        pm.price = temp["price"]
        pm.measured_at = temp["measured_at"]
        pm.discount = temp["discount"]
        result << pm
      end
    end
  
    result
  end


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