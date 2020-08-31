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
    # require "pry"; binding.pry
    model.create(row.to_h)
  end
end

puts "Adding merchants to db..."
spawn('merchants.csv', Merchant)

puts "Adding items to db..."
spawn('items.csv', Item)

puts "Adding customers to db..."
spawn('customers.csv', Customer)

puts "Adding invoices to db..."
spawn('invoices.csv', Invoice)

puts "Adding invoice_items to db..."
spawn('invoice_items.csv', InvoiceItem)

puts "Adding payments to db..."
spawn('transactions.csv', Payment)

puts "Data entry complete!"
