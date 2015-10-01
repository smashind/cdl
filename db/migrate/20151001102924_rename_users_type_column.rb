class RenameUsersTypeColumn < ActiveRecord::Migration
  def change
  	rename_column :users, :type, :package
  end
end
