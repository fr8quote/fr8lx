class CreateStatusTimes < ActiveRecord::Migration
  def change
    create_table :status_times do |t|
      t.string :status
      t.string :location
      t.string :notes
      t.references :user, index: true, foreign_key: true
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
