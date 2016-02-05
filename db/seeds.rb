# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..100).each do |i|
  User.create!(
    first_name: (0...8).map { (97 + rand(26)).chr }.join,
    last_name: (0...8).map { (97 + rand(26)).chr }.join
  )
end

(1..1000).each do |i|
  Product.create!(
    name: (0...8).map { (97 + rand(26)).chr }.join,
    unit_price: rand(10) + 1
  )
end

(1..50).each do |i|
  user = User.find(i)
  order = Order.new(user: user)

  (1..10).each do |j|
    product = Product.find(j + 50)
    qty     = rand(50) + 1
    order.orders_products.new(
      product: product,
      quantity: qty,
      cost: qty * product.unit_price
    )
  end

  order.amount = order.orders_products.map(&:cost).reduce(:+)

  order.save!
end
