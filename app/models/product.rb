class Product < ActiveRecord::Base
  belongs_to :category
  has_many :sub_product , dependent: :destroy
end
