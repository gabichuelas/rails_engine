namespace :data_setup do
  desc "clear dev db to prevent data duplication"
  task clear_tables: :environment do
    # delete all data in tables
    # Item.destroy_all
    # do in order!
  end

  desc "reset the primary key sequence for each table you import so that new records will receive the next valid primary key"
  task reset_keys: :environment do
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end

  desc "seed your db with the CSV data"
  task csv_seed: :environment do
    # manually run seeds.rb file?
    # use backticks to run ruby script
    `ruby seeds.rb`
  end

  desc "convert all prices before storing from cents to dollars"
  task price_convert: :environment do
    # this should probably be code in the model for each item that has prices?
  end
end
