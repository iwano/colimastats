namespace :db do

  desc "load user data from csv"
  task :load_csv_data2  => :environment do
    require 'csv'

    CSV.foreach("localities.csv") do |row|
      Locality.create(
        :city_id => row[0],
        :name => row[1],
        :state_id => row[2]
      )
    end
  end
end