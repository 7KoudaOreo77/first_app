class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.text :comment
      t.intenger :user_id
      t.intenger :post_image_id

      t.timestamps
    end
  end
end
