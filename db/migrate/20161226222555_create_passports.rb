class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports do |t|
      t.integer :user_id
      t.string :full_name
      t.integer :state
      t.timestamps null: false
    end
  end
end
