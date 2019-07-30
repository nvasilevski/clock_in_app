class CreateClockEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :clock_events do |t|
      t.string :event_type, limit: 16, null: false
      t.integer :user_id, null: false

      t.timestamps

      t.index :user_id
    end
  end
end
