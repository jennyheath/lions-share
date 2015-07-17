class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :type
      t.decimal :price
      t.decimal :bed_count
      t.decimal :bath_count
      t.string :neighborhood
      t.boolean :featured
      t.string :address
      t.text :description

      t.timestamps null: false
    end
  end
end
