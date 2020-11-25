class AddUserIdToInfolists < ActiveRecord::Migration[5.2]
  def change
    add_column :infolists, :user_id, :integer
  end
end
