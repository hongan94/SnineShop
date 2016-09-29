class AddViewToSubProduct < ActiveRecord::Migration
  def change
    add_column :sub_products, :view, :integer, default: 0
  end
end
