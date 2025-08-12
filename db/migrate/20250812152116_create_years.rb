class CreateYears < ActiveRecord::Migration[8.0]
  def change
    create_table :years do |t|
      t.integer :year
      t.references :make, null: false, foreign_key: true
      t.references :car_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
