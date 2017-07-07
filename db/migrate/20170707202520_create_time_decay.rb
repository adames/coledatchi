class CreateTimeDecay < ActiveRecord::Migration[5.1]
  def change
    create_table :time_decays do |t|
      t.datetime :last_action
      t.datetime :current_action
      t.integer :pet_id
      t.timestamps
    end
  end
end
