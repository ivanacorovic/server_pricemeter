require 'will_paginate/array'

class SupermarketsController < ApplicationController

	def index
		@supermarkets=Supermarket.all
	end

	def show
		@supermarket=Supermarket.find(params[:id])
	end

  private

  def supermarket_params
    params.require(:supermarket).permit(:name, :id)
  end

end