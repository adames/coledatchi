class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :pet_owner, default: false

      t.timestamps
    end
  end
end
