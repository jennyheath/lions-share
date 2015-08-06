class Amenity < ActiveRecord::Base

  # scope :by_amenity, -> amenity { where(:amenity => amenity) }

  has_many :listing_amenities
  has_many :listings, through: :listing_amenities
end
