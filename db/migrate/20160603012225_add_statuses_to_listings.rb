class AddStatusesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :just_sold, :boolean
    add_column :listings, :in_contract, :boolean
  end
end
