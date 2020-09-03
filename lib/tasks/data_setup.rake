require 'csv'

namespace :data_setup do

  desc "run them all"
  task all: :environment do
    Rake::Task['data_setup:clear_tables'].execute
    Rake::Task['data_setup:csv_seed'].execute
    Rake::Task['data_setup:reset_keys'].execute
  end

  desc "reset dev db to prevent data duplication"
  task clear_tables: :environment do
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
  end

  desc "seed dev db with csv data"
  task csv_seed: :environment do

    def spawn(filename, model)
      CSV.foreach(Rails.root.join("db/data/#{filename}"), headers: true) do |row|
        object = model.create!(row.to_h)
        if object.unit_price
          object.unit_price = object.unit_price.fdiv(100).round(2)
          object.save
        else
        end
      end
    end

    csv_data = {
      Merchant => 'merchants.csv',
      Item => 'items.csv',
      Customer => 'customers.csv',
      Invoice => 'invoices.csv',
      InvoiceItem => 'invoice_items.csv',
      Payment => 'transactions.csv'
    }

    csv_data.each do |model, csv_file|
      puts "Injecting #{model}s into dev db..."
      spawn(csv_file, model)
    end
  end

  desc "reset the primary key sequence for each table you import so that new records will receive the next valid primary key"
  task reset_keys: :environment do
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end
end
