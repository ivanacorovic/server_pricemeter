require 'will_paginate/array'

class ProductsController < ApplicationController
before_filter :authenticate_user!, only: [:new, :edit, :create]

	def index
		 @products = Product.search(params[:search])
		 @suggestion = Suggestion.new(name: params[:search])
	end

	def show
		@product = Product.find(params[:id])
		@supermarkets=@product.supermarkets.distinct
		@pricemeasures=@product.pricemeasures
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.create(product_params)
		redirect_to products_path
	end

	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def product_params
	  params.require(:product).permit(:name, :image)
	end
end