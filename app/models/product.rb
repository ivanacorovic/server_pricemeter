class Product < ActiveRecord::Base
	has_many :pricemeasures
	has_many :supermarkets, through: :pricemeasures

	def self.search(search)
		if search
			find(:all, :conditions =>['name LIKE ?',"%#{search}%"])
		else
			find(:all)
		end
	end

end
