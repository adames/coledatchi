class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :happiness
      t.integer :hygiene
      t.integer :hunger
      t.integer :user_id

      t.timestamps
    end
  end
end
