class FiltersController < ApplicationController

  has_scope :by_type_of
  # has_scope :by_neighborhood
  # has_scope :by_bed_count
  # has_scope :by_price
  # has_scope :by_amenity

  def filter_rentals
    rentals = apply_scopes(Listing).all

    render json: rentals
  end

  def filter_sales
    sales = apply_scopes(Listing).all

    render json: sales
  end

end
