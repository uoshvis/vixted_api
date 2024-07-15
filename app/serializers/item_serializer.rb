class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :user
end
