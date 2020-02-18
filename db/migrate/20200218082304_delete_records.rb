class DeleteRecords < ActiveRecord::Migration[5.2]
  def change
    drop_table :room_user_relations
  end
end