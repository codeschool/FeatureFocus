class AddAddressToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :address, :text
  end
end
