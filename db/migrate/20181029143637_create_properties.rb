class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :offer_type
      t.string :property_type
      t.string :zip_code
      t.string :city
      t.string :street
      t.string :house_number
      t.st_point :location, geographic: true
      t.integer :construction_year
      t.numeric :number_of_rooms
      t.string :currency
      t.numeric :price
      t.decimal :lat, precision: 19, scale: 8
      t.decimal :lng, precision: 19, scale: 8
    end

    add_index :properties, :location, using: :gist
  end
end
