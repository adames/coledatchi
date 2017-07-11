class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :history
      t.integer :pet_id

      t.timestamps
    end
  end
end
