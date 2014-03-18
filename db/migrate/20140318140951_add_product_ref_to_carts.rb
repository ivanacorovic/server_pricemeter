class AddProductRefToCarts < ActiveRecord::Migration
  def change
    add_reference :carts, :product, index: true
  end
end
