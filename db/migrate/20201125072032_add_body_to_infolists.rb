class AddBodyToInfolists < ActiveRecord::Migration[5.2]
  def change
    add_column :infolists, :body, :text
  end
end
