class CreatePersonalEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_events do |t|
      t.string :name
      t.string :description
      t.string :pet_type
      t.string :results

      t.timestamps
    end
  end
end
