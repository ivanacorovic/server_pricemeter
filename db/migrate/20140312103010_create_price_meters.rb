class CreatePriceMeters < ActiveRecord::Migration
  def change
    create_table :price_meters do |t|
    	
    	t.belongs_to :products
      t.belongs_to :supermarkets

      t.decimal :price
      t.timestamp :measured_at

      t.timestamps
    end
  end
end
