class RemoveCategoryFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :category_id, :integer
  end
end
