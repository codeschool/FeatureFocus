class DropReferrals < ActiveRecord::Migration
  def up
    drop_table :referrals
  end

  def down
    raise ActiveRecord::IrreversibleMigration.new
  end
end
