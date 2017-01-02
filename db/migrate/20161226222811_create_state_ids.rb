class CreateStateIds < ActiveRecord::Migration
  def change
    create_table :state_ids do |t|
      t.integer :user_id
      t.integer :state_id
      t.string :full_name #basically a confirm your name field
      t.timestamps null: false
    end
  end
end
