class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.text :info_name
      t.string :image_id
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
