class Listing < ActiveRecord::Base
  has_many :photos

  has_many :listing_brokers
  has_many :brokers, through: :listing_brokers

  has_many :listing_amenities
  has_many :amenities, through: :listing_amenities
end
