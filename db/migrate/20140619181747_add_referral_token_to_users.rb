class AddReferralTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :referral_token, :string
    add_index :users, :referral_token
  end
end
