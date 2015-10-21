class AddCodeToTests < ActiveRecord::Migration
  def change
  	add_column :tests, :code, :text
  end
end
