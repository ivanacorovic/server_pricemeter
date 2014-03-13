class CreatePricemeasures < ActiveRecord::Migration
  def change
    create_table :pricemeasures do |t|
      t.decimal :price
      t.timestamp :measured_at

      t.timestamps
    end
  end
end
