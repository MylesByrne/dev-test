class CreateCarModels < ActiveRecord::Migration[8.0]
  def change
    create_table :car_models do |t|
      t.string :name
      t.references :make, null: false, foreign_key: true

      t.timestamps
    end
  end
end
