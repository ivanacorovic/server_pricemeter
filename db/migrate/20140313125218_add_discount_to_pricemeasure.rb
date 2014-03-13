class AddDiscountToPricemeasure < ActiveRecord::Migration
  def change
    add_column :pricemeasures, :discount, :boolean
  end
end
