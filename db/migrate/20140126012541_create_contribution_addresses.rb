class CreateContributionAddresses < ActiveRecord::Migration
  def change
    create_table :contribution_addresses do |t|
      t.decimal :longitude, :precision => 15, :scale => 10, :default => 0.0
      t.decimal :latitude, :precision => 15, :scale => 10, :default => 0.0
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
