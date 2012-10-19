class State < ActiveRecord::Base
  attr_accessible :name
  has_many :cities
  has_many :localities
  has_many :stats
end
