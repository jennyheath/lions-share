class ListingBroker < ActiveRecord::Base
  belongs_to :listing
  belongs_to :broker
end
