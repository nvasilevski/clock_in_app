class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, limit: 20
      t.string :fullname, limit: 64
      t.string :status, limit: 16

      t.timestamps
    end
  end
end
