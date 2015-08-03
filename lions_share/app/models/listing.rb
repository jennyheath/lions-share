class Listing < ActiveRecord::Base

  scope :by_neighborhood, -> neighborhood { where(:neighborhood => neighborhood) }
  scope :by_bed_count, -> bed { where(:bed_count => bed) }
  scope :by_price, -> price { where(:price => price) }

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  has_many :photos

  has_many :listing_brokers
  has_many :brokers, through: :listing_brokers

  has_many :listing_amenities
  has_many :amenities, through: :listing_amenities

  def self.rentals
    Listing.where(type_of: "Rental")
  end

  def self.sales
    Listing.where(type_of: "Sale")
  end

end
