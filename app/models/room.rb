class Room < ApplicationRecord
  # association
  has_many :room_user_relations
  has_many :users, through: :room_user_relations
  mount_uploader :image, ImageUploader

  # validation
  validates :image,
            :title,
            :description,
            :category_id,
            :host_id, presence: true
end
