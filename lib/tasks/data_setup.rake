namespace :data_setup do

  desc "run them all"
  task all: :environment do
    Rake::Task['data_setup:clear_tables'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['data_setup:reset_keys'].execute
  end

  desc "reset dev db to prevent data duplication"
  task clear_tables: :environment do
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
  end

  desc "reset the primary key sequence for each table you import so that new records will receive the next valid primary key"
  task reset_keys: :environment do
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end
end
