class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :transaction, index: true, foreign_key: true
      t.references :sub_product, index: true, foreign_key: true
      t.integer :quantity
      t.integer :amount
      t.boolean :status
      t.timestamps null: false
    end
  end
end
