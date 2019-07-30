class RenameUsersEmailToLogin < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :email, :login
  end
end
