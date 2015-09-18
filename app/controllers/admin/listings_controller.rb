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

    @listing.main_photo_url = "http://res.cloudinary.com/" +
                              ENV['cloud_name'] + "/" + params[:image]

    @broker = Broker.find(params[:listing][:broker])
    @listing.brokers << @broker

    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_1])
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_2])
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_3])
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_4])
    @listing.photos << Photo.create!(url: "http://res.cloudinary.com/" + ENV['cloud_name'] + "/" + params[:image_5])

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
