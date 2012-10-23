class Locality < ActiveRecord::Base
  attr_accessible :city_id, :state_id, :name
  belongs_to :stat
  belongs_to :state
  belongs_to :city
  belongs_to :location

  default_scope order: 'localities.name ASC'
end
