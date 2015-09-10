class Admin::ListingsController < ApplicationController
  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @broker = Broker.find(params[:listing][:broker])
    @listing.brokers << @broker

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
    @listing = Listing.new
    render :new
  end

  private

  def listing_params
    params.require(:listing).permit(:type_of, :price, :bed_count, :bath_count, :neighborhood, :featured, :address, :description, :exclusive, :no_fee)
  end
end
