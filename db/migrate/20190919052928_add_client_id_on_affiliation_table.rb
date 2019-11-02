class AddClientIdOnAffiliationTable < ActiveRecord::Migration[5.2]
  def up
    add_column :affiliations, :client_id, :integer
  end

  def down
    remove_column :affiliations, :client_id, :integer
  end
end
