class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  def total
    quantity * product.price_in_dollars
  end
end
