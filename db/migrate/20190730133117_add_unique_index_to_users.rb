class AddUniqueIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.index :fullname, unique: true
      t.index :login, unique: true
    end
  end
end
