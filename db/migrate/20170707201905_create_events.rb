class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.integer :pet_health
      t.integer :pet_hunger
      t.integer :pet_boredom
      t.integer :pet_filthiness
      t.integer :pet_id
      
      t.timestamps
    end
  end
end
