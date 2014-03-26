class PricemeasuresController < ApplicationController

	def index
		@pricemeasures=Pricemeasure.all
	end
 


	def import
	  Pricemeasure.import(params[:file])
	  redirect_to root_path, notice: "Pricemeasures imported."
	end


 	private

	def supermarket_params
	  params.require(:supermarket).permit(:id, :price, :discount,
	  	:product_id, :supermarket_id, :measured_at)
	end

end