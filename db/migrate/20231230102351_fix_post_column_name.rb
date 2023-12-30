class FixPostColumnName < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :tag_id
  end
end
