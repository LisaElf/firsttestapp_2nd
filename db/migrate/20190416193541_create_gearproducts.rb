class CreateGearproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :gearproducts do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :gear_type

      t.timestamps
    end
  end
end
