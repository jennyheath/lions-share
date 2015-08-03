class ListingsController < ApplicationController

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

  end

  def sales

  end

  private

  def listing_params
    params.require(:listing).permit(:type_of, :price, :bed_count, :bath_count, :neighborhood, :featured, :address, :description)
  end

end
