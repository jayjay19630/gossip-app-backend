class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user
      t.references :tag
      t.integer :likes
      t.timestamps
    end
  end
end
