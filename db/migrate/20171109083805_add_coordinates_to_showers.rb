class AddCoordinatesToShowers < ActiveRecord::Migration[5.1]
  def change
    add_column :showers, :latitude, :float
    add_column :showers, :longitude, :float
  end
end
