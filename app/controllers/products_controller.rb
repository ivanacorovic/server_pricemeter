class ProductsController < ApplicationController

	def index
		 @products = Product.search(params[:search])
	end

	def show
		@product = Product.find(params[:id])
		@supermarkets=@product.supermarkets.distinct
		@pricemeasures=@product.pricemeasures
	end

end