class AddColunmToClient < ActiveRecord::Migration[5.2]
  def up
    add_column :clients, :affiliation_id, :integer
  end

  def down
    remove_column :clients, :affiliation_id, :integer
  end
end
