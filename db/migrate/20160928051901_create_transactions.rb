class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :status
      t.string :name
      t.string :email
      t.integer :phone
      t.integer :amount
      t.string :payment
      t.string :payment_info
      t.string :message
      t.string :security
      t.timestamps null: false
    end
  end
end
