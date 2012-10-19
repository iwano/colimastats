class City < ActiveRecord::Base
  attr_accessible :state_id, :name
  has_many :localities
  has_many :stats
  belongs_to :state
end
