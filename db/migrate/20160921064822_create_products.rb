class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :status
      t.integer :quantity
      t.string :image
      t.string :discount
      t.string :detail
      t.string :origin
      t.references :categories, foreign_key: true
      t.timestamps null: false
    end
  end
end
