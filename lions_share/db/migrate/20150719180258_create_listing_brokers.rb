class CreateListingBrokers < ActiveRecord::Migration
  def change
    create_table :listing_brokers do |t|
      t.belongs_to :listing
      t.belongs_to :broker

      t.timestamps null: false
    end
  end
end
