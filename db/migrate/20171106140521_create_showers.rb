class CreateShowers < ActiveRecord::Migration[5.1]
  def change
    create_table :showers do |t|
      t.string :address
      t.references :user, foreign_key: true
      t.string :picture
      t.string :title
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
