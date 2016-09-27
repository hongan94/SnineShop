class CreateSubProducts < ActiveRecord::Migration
  def change
    create_table :sub_products do |t|
      t.references :product, index: true, foreign_key: true
      t.string :name
      t.integer :price
      t.integer :quantity
      t.string :detail
      t.string :origin
      t.boolean :status
      t.integer :discount
      t.timestamps null: false
    end
  end
end
