class City < ActiveRecord::Base
  attr_accessible :state_id, :name
  has_many :localities
  has_many :stats
  belongs_to :state
  has_many :locations

  default_scope order: 'cities.id ASC'
end
