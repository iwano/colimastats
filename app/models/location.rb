class Location < ActiveRecord::Base
 attr_accessible :address, :latitude, :longitude, :name, :state_id, :city_id, :locality_id
 acts_as_gmappable :latitude => 'latitude', 
                    :longitude => 'longitude', 
                    :check_process => :prevent_geocoding,
                    :process_geocoding => true

 belongs_to :state
 belongs_to :city
 belongs_to :locality

      def gmaps4rails_address
          address
      end
       def gmaps4rails_infowindow
         "<h4>#{name}</h4>" << "<h4>#{address}</h4>"
     end
end