class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :address
      t.point :latlon, geographic: true

      t.timestamps
    end
  end
end
