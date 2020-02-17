class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.text :image, null: false
      t.string :title, null: false, index: true
      t.text :description, null: false
      t.integer :category_id, null: false
      t.references :host, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
