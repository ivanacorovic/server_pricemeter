class Product < ActiveRecord::Base
	has_many :pricemeasures
	has_many :supermarkets, through: :pricemeasures
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "30x30>" }, :default_url => "/images/:style/smoki.jpeg"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
	has_many :listitems
	
	def self.search(search)
		if search
			find(:all, :conditions =>['name LIKE ?',"%#{search}%"])
		else
			find(:all)
		end
	end

end
