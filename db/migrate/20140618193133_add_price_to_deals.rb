class AddPriceToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :price_in_cents, :integer
  end
end
