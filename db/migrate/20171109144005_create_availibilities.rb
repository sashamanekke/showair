class CreateAvailibilities < ActiveRecord::Migration[5.1]
  def change
    create_table :availibilities do |t|
      t.integer :hour
      t.boolean :available
      t.references :shower, foreign_key: true

      t.timestamps
    end
  end
end
