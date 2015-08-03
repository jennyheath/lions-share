class FiltersController < ApplicationController

  has_scope :by_neighborhood
  has_scope :by_bed
  has_scope :by_price
  # has_scope :by_amenity

  def rentals
    matches = apply_scopes(Listing).rentals

    render json: matches
  end

  def sales
    @matches = apply_scopes(Listing).sales
  end

end
