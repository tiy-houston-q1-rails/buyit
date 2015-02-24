class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :status, default: "shopping"

      t.timestamps null: false
    end
  end
end
