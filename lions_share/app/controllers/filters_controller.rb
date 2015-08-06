class FiltersController < ApplicationController

  has_scope :by_neighborhood
  has_scope :by_bed_count
  has_scope :by_price
  # has_scope :by_amenity

  def rentals
    rentals = apply_scopes(Listing).all

    render json: rentals
  end

  def sales
    @matches = apply_scopes(Listing).sales
  end

end
