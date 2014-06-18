class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.references :deal, index: true
      t.references :referrer, index: true
      t.string :referee_email, index: true
      t.text :token
      t.datetime :consumed_at
      t.datetime :collected_at

      t.timestamps
    end
  end
end
