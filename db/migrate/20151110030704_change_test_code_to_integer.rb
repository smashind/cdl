class ChangeTestCodeToInteger < ActiveRecord::Migration
  def change
  	change_column :tests, :code, 'integer USING CAST(code AS integer)'
  end
end
