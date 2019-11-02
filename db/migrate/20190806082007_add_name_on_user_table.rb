class AddNameOnUserTable < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :name, :string, null: false, default: "nanashi"
  end
end
