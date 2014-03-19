class CartsController < ApplicationController
before_filter :authenticate_user!, only: [:new, :edit, :create]
	def index
		@carts = Cart.all
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
    @list_selected.carts.where(:user_id == current_user.id).each do |cart|
      @selected_products << cart.product
    end
	end
 
	def new
		@cart = Cart.new
	end

	def create
		@cart = Cart.create(cart_params)
		redirect_to carts_path 
	end


	def calculate
	end

	def destroy
		@cart=Cart.where(user_id: params[:user_id], product_id: params[:product_id], 
			list_id: params[:list_id])

		if !@cart.empty? && @cart.first.destroy
			redirect_to carts_path
		end

	end


 private

    def cart_params
      params.permit(:user_id, :product_id, :list_id)
    #  params.fetch(:cart).permit! if params[:cart]
    end

end