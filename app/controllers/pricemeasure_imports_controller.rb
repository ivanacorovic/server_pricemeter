class PricemeasureImportsController < ApplicationController

  def new
    @pricemeasure_import = PricemeasureImport.new
  end

  def create
    if params[:pricemeasure_import].nil? 
      redirect_to :back
    else
      @pricemeasure_import = PricemeasureImport.new(params[:pricemeasure_import])
      @results = @pricemeasure_import.parse_spreadsheet(params[:supermarket_id].to_i)
    end
  end

  def upload
    @results = []
    params[:records].each do |r|
      pricemeasure = Pricemeasure.new
      if r["bar_code"].size == 8 || r["bar_code"].size == 13
        if !Product.find_by(bar_code: r["bar_code"].to_s).nil?
          pricemeasure.product_id = Product.find_by(bar_code: r["bar_code"].to_s).id
        else
           pricemeasure.product_id = nil
        end
      else
        pricemeasure.errors[:base] << "Must be 13 or 8 digits long!"
      end

      pricemeasure.supermarket_id = r["supermarket_id"]
    
      pricemeasure.price = r["price"].to_i unless r["price"] == ''

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