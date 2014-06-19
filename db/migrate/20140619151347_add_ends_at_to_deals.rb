class AddEndsAtToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :ends_at, :datetime
  end
end
