class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :customer_id, foreign_key: true

      t.timestamps
    end
  end
end
