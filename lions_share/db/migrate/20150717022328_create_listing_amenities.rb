class CreateListingAmenities < ActiveRecord::Migration
  def change
    create_table :listing_amenities do |t|
      t.belongs_to :amenity
      t.belongs_to :listing

      t.timestamps null: false
    end
  end
end
