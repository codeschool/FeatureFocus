class AddVendorToDeals < ActiveRecord::Migration
  def change
    add_reference :deals, :vendor, index: true
  end
end
