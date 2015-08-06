class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :type_of
      t.decimal :price
      t.decimal :bed_count
      t.decimal :bath_count
      t.string :neighborhood
      t.boolean :featured
      t.string :address
      t.text :description
      t.boolean :exclusive
      t.boolean :no_fee

      t.timestamps null: false
    end
  end
end
