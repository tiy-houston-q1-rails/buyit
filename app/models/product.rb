class Product < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  validates :name, :photo,  :description, :sku, presence: true

  validates :price, presence: true, numericality: {integer: true, greater_than: 0}

  def price_in_dollars
    price / 100.0
  end

end
