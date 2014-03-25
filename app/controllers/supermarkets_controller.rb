require 'will_paginate/array'

class SupermarketsController < ApplicationController

	def index
		@supermarkets = Supermarket.all
	end

	def show
		@supermarket = Supermarket.find(params[:id])
		@products = @supermarket.products
		@products = @products.paginate(:page => params[:page], :per_page => 10)
		@pricemeasures = @supermarket.pricemeasures
	end

	def discount
		@supermarket = Supermarket.find(params[:id])
		@pricemeasures = @supermarket.products_on_sale.page(params[:page]).per_page(10)
	end

  private

  def supermarket_params
    params.require(:supermarket).permit(:name, :id)
  end

end