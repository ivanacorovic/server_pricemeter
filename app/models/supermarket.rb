class Supermarket < ActiveRecord::Base

	has_many :pricemeasures, dependent: :delete_all
	has_many :products, through: :pricemeasures

	def products_on_sale
		Pricemeasure.get_products_on_sale(self)
	end
end
