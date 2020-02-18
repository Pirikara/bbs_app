class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :content,
            :user_id,
            :room_id, presence: true
end
