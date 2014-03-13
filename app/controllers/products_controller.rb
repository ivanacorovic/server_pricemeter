class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@supermarkets=@product.supermarkets.distinct
		@pricemeasures=@product.pricemeasures
	end


end