class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.time :hour
      t.references :user, foreign_key: true
      t.references :shower, foreign_key: true

      t.timestamps
    end
  end
end
