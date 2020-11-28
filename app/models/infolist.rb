class Infolist < ApplicationRecord
  attachment :image
  belongs_to :user
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 140 }
   has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end
