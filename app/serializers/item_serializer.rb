class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price
  belongs_to :user
end
