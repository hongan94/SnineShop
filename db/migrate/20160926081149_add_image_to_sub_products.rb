class AddImageToSubProducts < ActiveRecord::Migration
  def change
    add_column :sub_products, :image, :string
  end
end
