class Locality < ActiveRecord::Base
  attr_accessible :city_id, :state_id, :name
  has_one :stat
  belongs_to :state
  belongs_to :city
  belongs_to :location

  default_scope order: 'localities.name ASC'

  comma do

     name
     state :name => 'State'
     city :name => 'City'
     stat :altitude => 'Altitude', :latitude => 'ISBN-13'

   end

   comma :brief do

     name

   end
end
