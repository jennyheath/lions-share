class Listing < ActiveRecord::Base

  scope :by_neighborhood, -> neighborhood { where(:neighborhood => neighborhood) }
  scope :by_bed, -> degree { where(:degree => degree) }
  scope :by_price, -> degree { where(:degree => degree) }

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
