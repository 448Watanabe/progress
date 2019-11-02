class AddColumnOnClient < ActiveRecord::Migration[5.2]
  def up
    add_column :clients, :position, :string, null: true
  end
  def down
    drop_column :clients, :position
  end
end
