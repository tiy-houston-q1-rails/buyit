class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :photo
      t.integer :price
      t.text :description
      t.string :sku

      t.timestamps null: false
    end
  end
end
