class AddCardIdToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :card_number, :integer
    add_column :reservations, :expiration, :integer
    add_column :reservations, :security_code, :integer
  end
end
