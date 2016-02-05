class Product < ActiveRecord::Base
  has_many :orders_products
end
