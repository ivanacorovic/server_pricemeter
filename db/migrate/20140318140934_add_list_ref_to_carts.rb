class AddListRefToCarts < ActiveRecord::Migration
  def change
    add_reference :carts, :list, index: true
  end
end
