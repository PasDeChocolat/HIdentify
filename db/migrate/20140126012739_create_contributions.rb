class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.string :inoutstate
      t.string :aggregate
      t.string :range
      t.string :zip_code
      t.string :contributor_type
      t.string :candidate_name
      t.string :state
      t.date :date
      t.string :party
      t.string :reg_no
      t.string :city
      t.integer :amount
      t.string :non_monetary_yes_or_no
      t.string :district
      t.string :office
      t.string :street_address_1
      t.string :street_address_2
      t.string :county
      t.string :contributor_name
      t.string :election_period
      t.string :occupation
      t.string :non_monetary_description
      t.string :non_monetary_category
      t.string :employer
      t.references :contribution_address, index: true

      t.timestamps
    end
  end
end
