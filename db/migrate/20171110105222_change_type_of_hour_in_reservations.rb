class ChangeTypeOfHourInReservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :hour, :time
    add_column :reservations, :hour, :integer
  end
end
