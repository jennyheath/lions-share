class CreateBrokers < ActiveRecord::Migration
  def change
    create_table :brokers do |t|
      t.string :first_name
      t.string :last_name
      t.string :photo_url
      t.string :title
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
