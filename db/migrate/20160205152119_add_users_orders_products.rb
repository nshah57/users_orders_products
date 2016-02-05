class AddUsersOrdersProducts < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
    end

    create_table :orders do |t|
      t.belongs_to :user
      t.decimal :amount
    end

    create_table :products do |t|
      t.string :name
      t.decimal :unit_price
    end

    create_table :orders_products do |t|
      t.belongs_to :order
      t.belongs_to :product
      t.integer    :quantity, limit: 2
      t.decimal    :cost
    end
  end
end
