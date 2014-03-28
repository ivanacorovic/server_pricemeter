class PricemeasuresController < ApplicationController

	def index
		@pricemeasures=Pricemeasure.all
	end

	def create
		Pricemeasure.create(pricemeasure_params)
		redirect_to root_path
	end


 	private

	def pricemeasure_params
	  params.require(:pricemeasure).permit(:id, :price, :discount,
	  	:product_id, :supermarket_id, :measured_at)
	end

end