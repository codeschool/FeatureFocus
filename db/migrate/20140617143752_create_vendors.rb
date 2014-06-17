class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.point :latlon, geographic: true

      t.timestamps
    end
  end
end
