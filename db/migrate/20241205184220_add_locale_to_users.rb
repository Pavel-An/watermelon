class AddLocaleToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :locale, :string
  end
end
