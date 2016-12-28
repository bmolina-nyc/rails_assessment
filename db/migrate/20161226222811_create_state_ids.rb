class CreateStateIds < ActiveRecord::Migration
  def change
    create_table :state_ids do |t|
      t.integer :user_id
      t.integer :state_id
      t.timestamps null: false
    end
  end
end
