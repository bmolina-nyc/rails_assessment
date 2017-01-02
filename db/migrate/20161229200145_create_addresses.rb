class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :address_type
      t.integer :profile_id

      t.timestamps null: false
    end
  end
end
