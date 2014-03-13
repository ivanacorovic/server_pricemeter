class AddSupermarketRefToPricemeasure < ActiveRecord::Migration
  def change
    add_reference :pricemeasures, :supermarket, index: true
  end
end
