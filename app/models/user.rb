class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  
  has_many :items, dependent: :destroy

  def item_count
    self.items.size    
    end
end
