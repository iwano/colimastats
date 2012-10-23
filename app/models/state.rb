class State < ActiveRecord::Base
  attr_accessible :name
  has_many :cities
  has_many :localities
  has_many :stats
  has_many :locations

  default_scope order: 'states.name ASC'
end
