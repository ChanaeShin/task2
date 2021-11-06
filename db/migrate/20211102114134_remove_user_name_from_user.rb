class RemoveUserNameFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :user_name, :string
  end
end
