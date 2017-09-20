class CreateLikes < ActiveRecord::Migration[5.1]
  def up
    create_table :likes do |t|
      t.integer :photo_id
      t.integer :user_id

      t.timestamps
    end
  end

	def down
		drop_table :likes, if_exists: true
	end
end
