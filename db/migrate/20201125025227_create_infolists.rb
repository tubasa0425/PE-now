class CreateInfolists < ActiveRecord::Migration[5.2]
  def change
    create_table :infolists do |t|

      t.timestamps
    end
  end
end
