class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orders_products
end
