class Locality < ActiveRecord::Base
  attr_accessible :city_id, :state_id, :name
  has_many :stats
  belongs_to :state
  belongs_to :city
end
