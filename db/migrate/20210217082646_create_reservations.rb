class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :customer
      t.references :vehicle
      t.datetime :starts_at
      t.datetime :ends_at
      t.string   :tzoffset
      t.timestamps
    end
  end
end
