class RoomCategoryRelation < ApplicationRecord
  # association
  belongs_to :category
  belongs_to :room 
end
