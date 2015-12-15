class CreateForumBoards < ActiveRecord::Migration
  def change
    create_table :forum_boards do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
