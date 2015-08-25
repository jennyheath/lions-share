class ListingsController < ApplicationController

  def index
    # This is just test code -- I was testing out the filterrific gem

    @filterrific = Filterrific.new(Listing, params[:filterrific])
    @filterrific.select_options = {
      sorted_by: Listing.options_for_sorted_by,
      with_neighborhood: Listing.options_for_select,
      with_bed: Listing.options_for_select,
      with_price: Listing.options_for_select,
      with_amenities: Listing.options_for_select
    }

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    # ???
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)

    if listing.save
      redirect_to @listing
    else
      # error handling
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

    # This code was grabbed from the article I sent as well -- not fully functional yet
    @filterrific = Filterrific.new(Listing, params[:filterrific])
    @filterrific.select_options = {
      sorted_by: Listing.options_for_sorted_by,
      with_neighborhood: Listing.options_for_select,
      with_bed: Listing.options_for_select,
      with_price: Listing.options_for_select,
      # This will likely have to change, again because amenities is going to be more complicated -- it is a separate model entirely
      with_amenities: Listing.options_for_select
    }

    respond_to do |format|
      format.html
      format.js
    end
  end

  def sales
    render 'sales'
  end

  private

  def listing_params
    params.require(:listing).permit(:type_of, :price, :bed_count, :bath_count, :neighborhood, :featured, :address, :description, :exclusive, :no_fee)
  end

end
