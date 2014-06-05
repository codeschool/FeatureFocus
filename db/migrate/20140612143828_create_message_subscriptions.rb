class CreateMessageSubscriptions < ActiveRecord::Migration
  def change
    create_table :message_subscriptions do |t|
      t.references :message, index: true
      t.references :subscriber, index: true

      t.timestamps
    end
  end
end
