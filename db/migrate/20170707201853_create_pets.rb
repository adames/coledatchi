class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.integer :health, default: 10 #0 is dead, 10 is healthy
      t.integer :hunger, default: 0  #0 is full, 10 is starving
      t.integer :boredom, default: 0  #0 is entertained, 10 is catatonic
      t.integer :filthiness, default: 0 #0 is clean, 10 is filthy
      t.integer :user_id

      t.timestamps
    end
  end
end
