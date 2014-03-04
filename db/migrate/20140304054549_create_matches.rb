class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :search_token
      t.references :grouping, index: true
      t.references :contribution, index: true

      t.timestamps
    end
  end
end
