require 'cloudinary'

class Admin::BrokersController < ApplicationController
  before_action :require_signed_in!

  def new
    @broker = Broker.new
  end

  def create
    @broker = Broker.new(broker_params)

    if params[:image]
      @broker.photo_url = "http://res.cloudinary.com/" +
                              ENV['cloud_name'] + "/" + params[:image]
    end

    if @broker.save
      render :saved
    else
      flash.now[:errors] = @broker.errors.full_messages
      render :new
    end
  end

  def index
    @brokers = Broker.all
  end

  def edit
    @broker = Broker.find(params[:id])
  end

  def update
    @broker = Broker.find(params[:id])

    if params[:image]
      @broker.photo_url = "http://res.cloudinary.com/" +
                                ENV['cloud_name'] + "/" + params[:image]
    end

    if @broker.update_attributes(broker_params)
      render :saved
    else
      flash[:errors] = @broker.errors.full_messages
      render :edit
    end
  end

  def destroy
    @broker = Broker.find(params[:id])
    @broker.destroy
    flash[:notice] = ["Broker deleted"]
    @brokers = Broker.all
    render :index
  end

  private

  def broker_params
    params.require(:broker).permit(:first_name, :last_name, :title, :email, :phone)
  end
end
