class Product < ActiveRecord::Base
	has_many :pricemeasures
	has_many :supermarkets, through: :pricemeasures
end
