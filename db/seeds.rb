# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

def spawn(filename, model)
  CSV.foreach(Rails.root.join("db/data/#{filename}"), headers: true) do |row|
    model.create(row.to_h)
  end
end

spawn('merchants.csv', Merchant)
spawn('items.csv', Item)
spawn('customers.csv', Customer)
spawn('invoices.csv', Invoice)
spawn('invoice_items.csv', InvoiceItem)
spawn('transactions.csv', Transaction)
