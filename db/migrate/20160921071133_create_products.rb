class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category, index: true, foreign_key: true
      t.string :name
      t.integer :price
      t.integer :quantity
      t.string :detail
      t.string :origin
      t.string :status
      t.string :discount
      t.timestamps null: false
    end
  end
end
