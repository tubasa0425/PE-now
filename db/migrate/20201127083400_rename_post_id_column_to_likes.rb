class RenamePostIdColumnToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :infolist_id, :integer
  end
end
