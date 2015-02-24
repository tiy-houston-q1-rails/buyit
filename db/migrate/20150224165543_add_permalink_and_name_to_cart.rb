class AddPermalinkAndNameToCart < ActiveRecord::Migration
  def change
    add_column :carts, :permalink, :string
    add_column :carts, :name, :string
  end
end
