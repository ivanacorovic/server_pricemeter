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

  def bulk_update
    @results = []
    10.times do |i|
      pricemeasure = Pricemeasure.new(product_id: 1, supermarket_id: 1, measured_at: DateTime.now, price: rand(10), discount: true)
      @results << pricemeasure
    end
  end

  def upload
    @results = []
    params[:records].each do |r|
      
      @price = Pricemeasure.create(r)
      @results << @price unless @price.errors.empty?
    end
    if @results.empty?
     redirect_to root_path
    else
      render "bulk_update"
    end
  end

end 