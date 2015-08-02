class ListingsController < ApplicationController

  has_scope :by_neighborhood
  has_scope :by_bed
  has_scope :by_price
  has_scope :by_amenities

  def index
    @listings = Listing.all
  end

  def new

  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)

    if listing.save
      redirect_to @listing
    else

    end
  end

  def edit

  end

  def update

  end

  def delete

  end

  def rentals
    @rentals = Listing.where(type_of: "Rental")
  end

  def sales
    @sales = Listing.where(type_of: "Sale")
  end

  def rentals_filter
    apply_scopes(Listing.rentals).all
  end

  def sales_filter
    apply_scopes(Listing.sales).all
  end

  private

  def listing_params
    params.require(:listing).permit(:type_of, :price, :bed_count, :bath_count, :neighborhood, :featured, :address, :description)
  end

end
