class RemoveColumnFromRoom < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :image, :text
  end
end
