class RemoveCountryFromCustomers < ActiveRecord::Migration
  def up
    remove_column :customers, :country
  end

  def down
    add_column :customers, :country, :string
  end
end
