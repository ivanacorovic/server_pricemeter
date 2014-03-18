class CartsController < ApplicationController

	def index
		@carts = Cart.all
		@lists = List.all
	end
 
	def new
		@cart = Cart.new
	end
	def create
	end

 private

    def cart_params
      params.require(:cart).provide(:user_id, :discount,
      	 :product_id, :list_id)
    end

end