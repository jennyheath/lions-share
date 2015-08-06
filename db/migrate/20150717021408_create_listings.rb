class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :type_of
      t.integer :price
      t.integer :bed_count
      t.integer :bath_count
      t.string :neighborhood
      t.boolean :featured
      t.string :address
      t.text :description
      t.boolean :exclusive
      t.boolean :no_fee
      t.string :main_photo_url

      t.timestamps null: false
    end
  end
end
