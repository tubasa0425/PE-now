class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_images, dependent: :destroy
  has_many :infolists, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_infolists, through: :likes, source: :infolist
  attachment :profile_image, destroy: 
  
  def already_liked?(infolist)
    self.likes.exists?(infolist_id: infolist.id)
  end
end
