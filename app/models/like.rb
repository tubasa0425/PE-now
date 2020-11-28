class Like < ApplicationRecord
  belongs_to :infolist
  belongs_to :user
  validates_uniqueness_of :infolist_id, scope: :user_id
end
