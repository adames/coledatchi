class CreateRandomEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :random_events do |t|
      t.string :name
      t.string :description
      t.string :results

      t.timestamps
    end
  end
end
