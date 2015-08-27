class Listing < ActiveRecord::Base

  # This is not working yet -- refer to the articles I attached about the gem
  # Also need to create the scope :with_amenities for the amenities. This is going to be more complicated because Amenity is its own model -- you may want to just create your own search filter for that (e.g. search for all the listings that have each amenity in the array)

  # Also, as you can see from the migration for creation of this model, I decided not to have separate Sale and Rental models because there were so many fields that would be repeated -- it added unnecessary clunkiness to the data model

  filterrific(
    default_filter_params: {
      sorted_by: 'created_at_desc'
    },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_neighborhood,
      :with_bed,
      :with_price,
      :with_amenities
    ]
  )

  scope :with_type, lambda { where(:type_of => type_of) }

  scope :with_neighborhood, lambda { |neighborhoods|
    where(neighborhood: [*neighborhoods])
  }

  scope :with_bed, lambda { |beds|
    where(bed_count: [*beds])
  }

  scope :with_price, lambda { |prices|
    where(price: [*prices])
  }

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  has_many :photos

  has_many :listing_brokers
  has_many :brokers, through: :listing_brokers

  has_many :listing_amenities
  has_many :amenities, through: :listing_amenities

  # These are just simple methods I wrote to easily refer to all the rentals (Listing.rentals) and all the sales (Listing.sales)

  def self.rentals
    Listing.where(type_of: "Rental")
  end

  def self.sales
    Listing.where(type_of: "Sale")
  end

end
