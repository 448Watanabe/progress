class AddRefOnAction < ActiveRecord::Migration[5.2]
  def up
    add_reference :actions, :client, index: true
  end

  def down
    remove_reference :actions, :client, indext: true
    remove_foregin_key :actions, :clients
  end
end
