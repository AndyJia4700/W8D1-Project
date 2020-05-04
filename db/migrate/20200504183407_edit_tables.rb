class EditTables < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :post_author_id, :integer
    add_index :posts, :post_author_id
  end
end
