class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.string :name
      t.string :description
      t.datetime :event_time
      t.string :results
      t.belongs_to :story, foreign_key: true

      t.timestamps
    end
  end
end
