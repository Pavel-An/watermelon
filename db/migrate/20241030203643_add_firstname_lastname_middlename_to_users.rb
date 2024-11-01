class AddFirstnameLastnameMiddlenameToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :firstname,  :string
    add_column :users, :lastname,   :string
    add_column :users, :middlename, :string
  end
end
