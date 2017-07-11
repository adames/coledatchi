class AddEmailToUsers < ActiveRecord::Migration[5.1]

#added as users were already created and migrated, this way we don't have to do a db:drop

  def change
    add_column :users, :email, :string
  end
end
