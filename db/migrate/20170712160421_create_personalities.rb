class CreatePersonalities < ActiveRecord::Migration[5.1]
  def change
    create_table :personalities do |t|
      t.string :type
      t.belongs_to :pet

      t.timestamps
    end
  end
end
