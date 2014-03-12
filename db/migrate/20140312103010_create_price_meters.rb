class CreatePriceMeters < ActiveRecord::Migration
  def change
    create_table :price_meters do |t|
    	
    	t.belongs_to :product
      t.belongs_to :supermarket

      t.decimal :price
      t.timestamp :measured_at

      t.timestamps
    end
  end
end
