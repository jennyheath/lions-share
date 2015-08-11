class ListingsController < ApplicationController

  def index
    # render 'rentals'
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
    render 'rentals'
  end

  def sales
    render 'sales'
  end

  private

  def listing_params
    params.require(:listing).permit(:type_of, :price, :bed_count, :bath_count, :neighborhood, :featured, :address, :description, :exclusive, :no_fee)
  end

end
