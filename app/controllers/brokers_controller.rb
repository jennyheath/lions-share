class BrokersController < ApplicationController
  def index
    @brokers = Broker.all
  end

  def show
  	@broker = Broker.find(params[:id])
  	@listings = Listing.joins(:listing_brokers).where("listings.id = listing_brokers.listing_id AND listing_brokers.broker_id = ?", @broker.id)
  end
end
