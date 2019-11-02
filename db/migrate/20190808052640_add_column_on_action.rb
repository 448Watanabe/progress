class AddColumnOnAction < ActiveRecord::Migration[5.2]
  def up
    add_column :actions, :content, :text, null: false, default: ""
  end

  def down
    remove_column :actions, :content
  end
end
