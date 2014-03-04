class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :is_match
      t.text :comment
      t.references :match, index: true

      t.timestamps
    end
  end
end
