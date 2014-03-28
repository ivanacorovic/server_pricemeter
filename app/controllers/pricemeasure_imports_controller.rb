class PricemeasureImportsController < ApplicationController

  def new
    @pricemeasure_import = PricemeasureImport.new
  end

  def create
    if params[:pricemeasure_import].nil? 
      redirect_to :back
    else
      @pricemeasure_import = PricemeasureImport.new(params[:pricemeasure_import])
      @results = @pricemeasure_import.parse_spreadsheet
    end
  end

  def upload
    @results = []
    params[:records].each do |r|
      pricemeasure = Pricemeasure.new
      if !Product.find_by(bar_code: r["bar_code"].to_s).nil?
        pricemeasure.product_id = Product.find_by(bar_code: r["bar_code"].to_s).id
      else
         pricemeasure.product_id = nil
      end

      pricemeasure.supermarket_id = 1
    
      pricemeasure.price = r["price"].to_i
      pricemeasure.measured_at = r["measured_at"] 
      pricemeasure.discount = r["discount"] 

      pricemeasure.save

      @results << pricemeasure unless pricemeasure.errors.empty?
    end
    if @results.empty?
     redirect_to root_path
    else
      render "create"
    end
  end

end 