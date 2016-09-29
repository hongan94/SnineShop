class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.shopping_cart_item_fields
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
      t.string :name
      t.integer :quantity
      t.string :size
      t.integer :price
      t.boolean :status
    end
  end
end