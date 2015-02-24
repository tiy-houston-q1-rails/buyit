require 'securerandom'

class Cart < ActiveRecord::Base
  include Payola::Sellable

  has_many :cart_items

  before_validation on: :create do
    self.permalink = SecureRandom.hex
    self.name = "Cart on Buy it!"
  end


  def total
    cart_items.map do |item|
      item.total
    end.sum
  end

  def price
    total * 100.0
  end

  def redirect_path(sale)
    "/cart"
  end
end
