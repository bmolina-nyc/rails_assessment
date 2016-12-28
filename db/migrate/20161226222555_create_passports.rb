class CreatePassports < ActiveRecord::Migration
  def change
    create_table :passports do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :state
      t.timestamps null: false
    end
  end
end
