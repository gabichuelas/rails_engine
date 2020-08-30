# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.foreach(Rails.root.join('db/data/items.csv'), headers: true) do |row|
  Item.create({
    # item attributes here
    })
end

# CSV.foreach(Rails.root.join('db/data/merchants.csv'), headers: true) do |row|
#   Merchant.create({
#     # merchant attributes here
#     })
# end
#
# CSV.foreach(Rails.root.join('db/data/customers.csv'), headers: true) do |row|
#   Customer.create({
#     # customer attributes here
#     })
# end
#
# CSV.foreach(Rails.root.join('db/data/invoices.csv'), headers: true) do |row|
#   Invoice.create({
#     # invoice attributes here
#     })
# end
#
# CSV.foreach(Rails.root.join('db/data/invoice_items.csv'), headers: true) do |row|
#   InvoiceItem.create({
#     # invoice_item attributes here
#     })
# end
#
# CSV.foreach(Rails.root.join('db/data/transactions.csv'), headers: true) do |row|
#   Transaction.create({
#     # transaction attributes here
#     })
# end
