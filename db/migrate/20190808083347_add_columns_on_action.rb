class AddColumnsOnAction < ActiveRecord::Migration[5.2]
  def up
    add_column :actions, :state, :string, null: true, default: "なし"
    add_column :actions, :expectation, :string, null: true, default: "なし"
  end
  def down
    remove_column :actions, :state
    remove_column :actions, :expectation
  end
  
end
