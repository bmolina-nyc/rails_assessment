class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.integer :user_id
      t.integer :state_id
      t.string :full_name
      t.timestamps null: false
    end
  end
end
