class AddBioToBrokers < ActiveRecord::Migration
  def change
    add_column :brokers, :bio, :text
  end
end
