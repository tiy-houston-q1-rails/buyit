class Cart < ActiveRecord::Base
  has_many :cart_items

  def total
    cart_items.map do |item|
      item.total
    end.sum
  end
end
