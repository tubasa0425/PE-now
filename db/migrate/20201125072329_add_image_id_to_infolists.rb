class AddImageIdToInfolists < ActiveRecord::Migration[5.2]
  def change
    add_column :infolists, :image_id, :string
  end
end
