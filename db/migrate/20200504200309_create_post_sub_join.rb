class CreatePostSubJoin < ActiveRecord::Migration[5.2]
  def change
    create_table :post_sub_joins do |t|
      t.integer :sub_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
    add_index :post_sub_joins, :sub_id
    add_index :post_sub_joins, :post_id
  end
end
