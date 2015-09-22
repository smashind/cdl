class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.belongs_to :question, index: true, foreign_key: true
      t.boolean :is_correct
      t.string :answer

      t.timestamps null: false
    end
  end
end
