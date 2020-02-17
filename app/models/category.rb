class Category < ApplicationRecord
  has_many :room_category_relations
  has_many :rooms, through: :room_category_relations
end
