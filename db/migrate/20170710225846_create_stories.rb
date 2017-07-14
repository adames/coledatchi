class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :history
      t.belongs_to :pet

      t.timestamps
    end
  end
end
