class Supermarket < ActiveRecord::Base
	has_many :pricemeasures
	has_many :products, through: :pricemeasures
end
