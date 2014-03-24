
require 'will_paginate/array'

class ListitemsController < ApplicationController
before_filter :authenticate_user!, only: [:new, :edit, :create]
	def index
		@listitems = Listitem.all
		@lists = List.all
		if @lists
			if params[:selected_list] 
				@list_selected=List.find(params[:selected_list])
			else
				@list_selected=List.first
			end
		else
      raise ActionController::RoutingError.new('Forbidden')
    end

    @products = Product.search(params[:search])
    @selected_products =[]
    @list_selected.listitems.where(:user_id == current_user.id).each do |listitem|
      @selected_products << listitem.product
    end

    @suggestion = Suggestion.new(name: params[:search])
    
	end
 
	def new
		@listitem = Listitem.new
	end

	def create
		@listitem = Listitem.create(listitem_params)
		redirect_to :back
	end


	def calculate
		@supermarkets = Supermarket.all
		@prices = Pricemeasure.all
		@selected_products = params[:products]
	end

	def destroy
		@listitem=Listitem.where(user_id: params[:user_id], product_id: params[:product_id], 
			list_id: params[:list_id])

		if !@listitem.empty? && @listitem.first.destroy
			redirect_to :back
		end

	end


	private

	def listitem_params
	  params.permit(:user_id, :product_id, :list_id)
	#  params.fetch(:listitem).permit! if params[:listitem]
	end

end