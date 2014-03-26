class PricemeasureImportsController < ApplicationController

  def new
    @pricemeasure_import = PricemeasureImport.new
  end

  def create
    if params[:pricemeasure_import].nil? 
      redirect_to :back
      else
      @pricemeasure_import = PricemeasureImport.new(params[:pricemeasure_import])
      if @pricemeasure_import.save
        redirect_to root_path, notice: "Imported products successfully."
      else
        render 'new'
      end
    end
  end

end