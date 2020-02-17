class Room < ApplicationRecord
  # association
  has_many :room_user_relations
  has_many :users, through: :room_user_relations
  has_many :room_category_relations
  has_many :categories, through: :room_category_relations
  mount_uploader :image, ImageUploader

  # validation
  validates :title,
            :description,
            :category_ids,
            :host_id, presence: true
end
