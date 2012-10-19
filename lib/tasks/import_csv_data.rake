namespace :db do

  desc "load user data from csv"
  task :load_csv_data  => :environment do
    require 'fastercsv'

    FasterCSV.foreach("data.csv") do |row|
      User.create(
        :user_name => row[0],
        :email => row[1],
        :password => row[2]
      )
    end
  end
end