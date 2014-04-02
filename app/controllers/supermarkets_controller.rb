require 'will_paginate/array'

class SupermarketsController < ApplicationController

	def index
		@supermarkets = Supermarket.all
	end

	def show
		@supermarket = Supermarket.find(params[:id])
		#@products = @supermarket.products.distinct
		@pricemeasures = Pricemeasure.by_market(@supermarket).latest_prices
		@pricemeasures = @pricemeasures.paginate(:page => params[:page], :per_page => 10)
	end

	def discount
		@supermarket = Supermarket.find(params[:id])
		@pricemeasures = Pricemeasure.by_market(@supermarket).latest_prices.products_on_sale
		@pricemeasures = @pricemeasures.paginate(:page => params[:page], :per_page => 10)
	end

  private

  def supermarket_params
    params.require(:supermarket).permit(:name, :id)
  end

end