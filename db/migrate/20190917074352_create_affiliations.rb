class CreateAffiliations < ActiveRecord::Migration[5.2]
  def change
    create_table :affiliations do |t|
      t.string :name
      t.string :address
      t.string :call
      t.string :email
      t.text :memo

      t.timestamps
    end
  end
end
