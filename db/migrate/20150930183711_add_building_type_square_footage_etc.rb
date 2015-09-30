class AddBuildingTypeSquareFootageEtc < ActiveRecord::Migration
  def change
    add_column :listings, :building_type, :string
    add_column :listings, :square_footage, :integer
    add_column :listings, :lot_square_footage, :integer
    add_column :listings, :yearly_taxes, :integer
    add_column :listings, :floor_plan_url, :string
  end
end
