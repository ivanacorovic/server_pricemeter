class SuggestionsController < ApplicationController

	before_filter :authenticate_user!, only: [:create, :destroy]
	
	def index
		@suggestions = Suggestion.all
	end

	def show
		@suggestion = Suggestion.find(params[:id])
	end

	def create
			@suggestion = Suggestion.create(suggestion_params)
			redirect_to products_path
	end

	def serve
		@suggestion=Suggestion.find(params[:id])
		@product=Product.create(name: @suggestion.name)
		redirect_to edit_admin_product_path(@product)
		@suggestion.destroy
	end

 	private

  def suggestion_params
    params.require(:suggestion).permit(:name)
  end


end