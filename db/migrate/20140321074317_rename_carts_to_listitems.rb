class RenameCartsToListitems < ActiveRecord::Migration
  def change
  	rename_table :carts, :listitems
  end
end
