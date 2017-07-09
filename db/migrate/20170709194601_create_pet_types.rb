class CreatePetTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :pet_types do |t|
      t.string :species
      t.string :greeting
      t.string :farewell
      t.string :happiness
      t.string :sadness
      t.string :anger

    end
  end
end
