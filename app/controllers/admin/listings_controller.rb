require 'cloudinary'

class Admin::ListingsController < ApplicationController
  before_action :require_signed_in!

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.address = params[:street_address] + ", " + params[:city] + ", NY " + params[:zip]
    @listing.featured = false if !params[:listing][:featured]
    @listing.exclusive = false if !params[:listing][:exclusive]
    @listing.no_fee = false if !params[:listing][:no_fee]

    if params[:image]
      @listing.main_photo_url = "http://res.cloudinary.com/" +
                              ENV['cloud_name'] + "/" + params[:image]
    end

    @broker = Broker.find(params[:listing][:broker])
    @listing.brokers << @broker

    @listing.amenities = []
    if params[:listing][:highceilings]
      @listing.amenities << Amenity.find_by_name('High Ceilings')
    end
    if params[:listing][:parking]
      @listing.amenities << Amenity.find_by_name('Parking')
    end
    if params[:listing][:luxuries]
      @listing.amenities << Amenity.find_by_name('Luxuries')
    end
    if params[:listing][:skylineview]
      @listing.amenities << Amenity.find_by_name('Skyline view')
    end
    if params[:listing][:elevator]
      @listing.amenities << Amenity.find_by_name('Elevator')
    end
    if params[:listing][:granitecountertops]
      @listing.amenities << Amenity.find_by_name('Granite countertops')
    end
    if params[:listing][:sharedbackyard]
      @listing.amenities << Amenity.find_by_name('Shared backyard')
    end
    if params[:listing][:dishwasher]
      @listing.amenities << Amenity.find_by_name('Dishwasher')
    end
    if params[:listing][:eatinkitchen]
      @listing.amenities << Amenity.find_by_name('Eat In Kitchen')
    end
    if params[:listing][:allpetsok]
      @listing.amenities << Amenity.find_by_name('All pets ok')
    end
    if params[:listing][:catsonly]
      @listing.amenities << Amenity.find_by_name('Cats only')
    end
    if params[:listing][:smalldogsallowed]
      @listing.amenities << Amenity.find_by_name('Small dogs allowed')
    end
    if params[:listing][:doorman]
      @listing.amenities << Amenity.find_by_name('Doorman')
    end
    if params[:listing][:laundryinbuilding]
      @listing.amenities << Amenity.find_by_name('Laundry In building')
    end
    if params[:listing][:zipcar]
      @listing.amenities << Amenity.find_by_name('Zipcar')
    end
    if params[:listing][:hardwoodfloors]
      @listing.amenities << Amenity.find_by_name('Hardwood floors')
    end
    if params[:listing][:roofdeck]
      @listing.amenities << Amenity.find_by_name('RoofDeck')
    end
    if params[:listing][:roofaccess]
      @listing.amenities << Amenity.find_by_name('Roof access')
    end
    if params[:listing][:stainlessteelappliances]
      @listing.amenities << Amenity.find_by_name('Stainless Steel Appliances')
    end
    if params[:listing][:outdoorspace]
      @listing.amenities << Amenity.find_by_name('Outdoor Space')
    end
    if params[:listing][:videointercom]
      @listing.amenities << Amenity.find_by_name('Video Intercom')
    end

    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_1]) if params[:image_1]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_2]) if params[:image_2]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_3]) if params[:image_3]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_4]) if params[:image_4]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_5]) if params[:image_5]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_6]) if params[:image_6]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_7]) if params[:image_7]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_8]) if params[:image_8]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_9]) if params[:image_9]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_10]) if params[:image_10]

    if @listing.save
      render :saved
    else
      flash.now[:errors] = @listing.errors.full_messages
      render :new
    end
  end

  def index
    @listings = Listing.all
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.address = params[:street_address]

    if params[:image]
      @listing.main_photo_url = "http://res.cloudinary.com/" +
                                ENV['cloud_name'] + "/" + params[:image]
    end

    @listing.brokers = []
    @broker = Broker.find(params[:listing][:broker])
    @listing.brokers << @broker

    @listing.amenities = []
    if params[:listing][:highceilings]
      @listing.amenities << Amenity.find_by_name('High Ceilings')
    end
    if params[:listing][:parking]
      @listing.amenities << Amenity.find_by_name('Parking')
    end
    if params[:listing][:luxuries]
      @listing.amenities << Amenity.find_by_name('Luxuries')
    end
    if params[:listing][:skylineview]
      @listing.amenities << Amenity.find_by_name('Skyline view')
    end
    if params[:listing][:elevator]
      @listing.amenities << Amenity.find_by_name('Elevator')
    end
    if params[:listing][:granitecountertops]
      @listing.amenities << Amenity.find_by_name('Granite countertops')
    end
    if params[:listing][:sharedbackyard]
      @listing.amenities << Amenity.find_by_name('Shared backyard')
    end
    if params[:listing][:dishwasher]
      @listing.amenities << Amenity.find_by_name('Dishwasher')
    end
    if params[:listing][:eatinkitchen]
      @listing.amenities << Amenity.find_by_name('Eat In Kitchen')
    end
    if params[:listing][:allpetsok]
      @listing.amenities << Amenity.find_by_name('All pets ok')
    end
    if params[:listing][:catsonly]
      @listing.amenities << Amenity.find_by_name('Cats only')
    end
    if params[:listing][:smalldogsallowed]
      @listing.amenities << Amenity.find_by_name('Small dogs allowed')
    end
    if params[:listing][:doorman]
      @listing.amenities << Amenity.find_by_name('Doorman')
    end
    if params[:listing][:laundryinbuilding]
      @listing.amenities << Amenity.find_by_name('Laundry In building')
    end
    if params[:listing][:zipcar]
      @listing.amenities << Amenity.find_by_name('Zipcar')
    end
    if params[:listing][:hardwoodfloors]
      @listing.amenities << Amenity.find_by_name('Hardwood floors')
    end
    if params[:listing][:roofdeck]
      @listing.amenities << Amenity.find_by_name('RoofDeck')
    end
    if params[:listing][:roofaccess]
      @listing.amenities << Amenity.find_by_name('Roof access')
    end
    if params[:listing][:stainlessteelappliances]
      @listing.amenities << Amenity.find_by_name('Stainless Steel Appliances')
    end
    if params[:listing][:outdoorspace]
      @listing.amenities << Amenity.find_by_name('Outdoor Space')
    end
    if params[:listing][:videointercom]
      @listing.amenities << Amenity.find_by_name('Video Intercom')
    end

    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_1]) if params[:image_1]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_2]) if params[:image_2]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_3]) if params[:image_3]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_4]) if params[:image_4]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_5]) if params[:image_5]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_6]) if params[:image_6]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_7]) if params[:image_7]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_8]) if params[:image_8]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_9]) if params[:image_9]
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_10]) if params[:image_10]

    if @listing.update_attributes(listing_params)
      render :saved
    else
      flash[:errors] = @listing.errors.full_messages
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    flash[:notice] = ["Listing deleted"]
    @listings = Listing.all
    render :index
  end

  private

  def listing_params
    params.require(:listing).permit(:type_of, :price, :bed_count, :bath_count, :neighborhood, :featured, :address, :description, :exclusive, :no_fee)
  end
end
