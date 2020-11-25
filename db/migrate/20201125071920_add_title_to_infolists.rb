class AddTitleToInfolists < ActiveRecord::Migration[5.2]
  def change
    add_column :infolists, :title, :string
  end
end
