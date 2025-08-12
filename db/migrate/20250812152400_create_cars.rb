class CreateCars < ActiveRecord::Migration[8.0]
  def change
    create_table :cars do |t|
      t.references :make, null: false, foreign_key: true
      t.references :car_model, null: false, foreign_key: true
      t.references :year, null: false, foreign_key: true
      t.string :trim
      t.integer :count

      t.timestamps
    end
  end
end
