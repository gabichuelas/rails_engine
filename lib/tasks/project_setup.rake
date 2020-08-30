namespace :project_setup do
  desc "clear dev db to prevent data duplication"
  task clear: :environment do
    # maybe a rails db:reset? but reset includes 'seed'
  end

  desc "seed your db with the CSV data"
  task csv_seed: :environment do
    # import csv to seed data?
  end

  desc "convert all prices before storing from cents to dollars"
  task price_convert: :environment do
    # this should probably be code in the model for each item that has prices?
  end

  desc "reset the primary key sequence for each table you import so that new records will receive the next valid primary key"
  task reset_keys: :environment do
    # not sure what this means
  end

end
