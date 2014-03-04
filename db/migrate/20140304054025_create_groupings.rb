class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.string :name

      t.timestamps
    end
  end
end
