class Broker < ActiveRecord::Base
  has_many :messages

  has_many :listing_brokers
  has_many :listings, through: :listing_brokers
end
