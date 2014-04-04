#require 'will_paginate/array'
require 'kaminari'

class SupermarketsController < ApplicationController

	def index
		@supermarkets = Supermarket.all
	end

	def show
		@supermarket = Supermarket.find(params[:id])
		#@products = @supermarket.products.distinct
		@pricemeasures = Pricemeasure.by_market(@supermarket).latest_prices
		@pricemeasures = Kaminari.paginate_array(@pricemeasures).page(params[:page]).per(10)
	end

	def discount
		@supermarket = Supermarket.find(params[:id])
		@pricemeasures = Pricemeasure.by_market(@supermarket).latest_prices.products_on_sale
		@pricemeasures = Kaminari.paginate_array(@pricemeasures).page(params[:page]).per(10)
	end

  private

  def supermarket_params
    params.require(:supermarket).permit(:name, :id)
  end

end