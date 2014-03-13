class AddProductRefToPricemeasure < ActiveRecord::Migration
  def change
    add_reference :pricemeasures, :product, index: true
  end
end
