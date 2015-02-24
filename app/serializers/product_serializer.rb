class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :thumb_url, :large_url

  def thumb_url
    object.photo.url(:thumb)
  end

  def large_url
    object.photo.url(:large)
  end
end
