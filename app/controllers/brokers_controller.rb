class BrokersController < ApplicationController
  def index
    @brokers = Broker.all
  end
end
