class Room < ApplicationRecord
  # association
  # has_many :room_user_relations
  # has_many :users, through: :room_user_relations
  belongs_to :host, class_name: "User"
  has_many :room_category_relations, dependent: :destroy
  has_many :categories, through: :room_category_relations
  has_many :messages, dependent: :destroy
  mount_uploader :image, ImageUploader

  # validation
  validates :title,
            :description,
            :category_ids,
            :host_id, presence: true
end
