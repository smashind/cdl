class AddMissedToAttempts < ActiveRecord::Migration
  def change
    add_column :attempts, :incorrect, :integer
  end
end
