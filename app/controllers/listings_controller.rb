class ListingsController < ApplicationController

  def index
    @neighborhoods = Listing.all.uniq.pluck(:neighborhood)
    @beds = Listing.all.uniq.pluck(:bed_count).sort
    amenities = []
    Listing.all.each do |listing|
      listing.amenities.each do |amenity|
        amenities.push(amenity.name)
      end
    end
    @amenities = amenities.uniq
    puts params[:filter_params]

    if params[:filter_params]
      filter_params = params[:filter_params]
      sql_str = <<-SQL
        SELECT
        listings.*
        FROM
        listings
        LEFT OUTER JOIN
        listing_amenities ON listings.id = listing_amenities.listing_id
        LEFT OUTER JOIN
        amenities ON listing_amenities.amenity_id = amenities.id
        WHERE
        listings.id > -1
      SQL

      neighborhoods = params[:neighborhood_params].to_a
      beds = params[:bed_params].to_a
      price_range = params[:price_params].to_a
      no_fee = params[:no_fee_params]
      amenities = params[:amenity_params].to_a

      filter_query = ""
      if !neighborhoods.empty?
        neighborhoods_query = (Array.new(neighborhoods.count, "listings.neighborhood LIKE ?"))
                              .join(" OR ")
        filter_query += " AND (" + neighborhoods_query + ")"
      end
      if !beds.empty?
        beds_query = (Array.new(beds.count, "listings.bed_count = ?"))
                     .join(" OR ")
        filter_query += " AND (" + beds_query + ")"
      end
      if !price_range.empty?
        price_query = "listings.price >= " + price_range[0].to_s +
                      " AND listings.price <= " + price_range[1].to_s
        filter_query += " AND (" + price_query + ")"
      end
      if no_fee.to_s == true
        filter_query += " AND (no_fee = true)"
      end

      # amenities_query = (Array.new(amenities.count, "amenities.name LIKE ?"))
      #                   .join(" AND ")
      # filter_query += "AND (" + amenities_query + ")" if !amenities.empty?

      query = [sql_str + " " + filter_query] + neighborhoods + beds
      @listings = Listing.find_by_sql(query).uniq
      render :index
    else
      @listings = Listing.all
      render :index
    end
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
