class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :status_id
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
