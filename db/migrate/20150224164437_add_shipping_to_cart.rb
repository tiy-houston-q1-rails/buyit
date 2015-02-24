class AddShippingToCart < ActiveRecord::Migration
  def change
    add_column :carts, :address_line_1, :string
    add_column :carts, :address_line_2, :string
    add_column :carts, :city, :string
    add_column :carts, :state, :string
    add_column :carts, :zip, :string
  end
end
