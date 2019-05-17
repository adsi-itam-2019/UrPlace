class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :address
      t.string :postal
      t.string :description
      t.string :lat
      t.string :lon
      t.float :rating
      t.float :price

      t.timestamps
    end
  end
end
