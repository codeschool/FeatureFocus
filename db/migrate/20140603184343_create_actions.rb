class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :user, index: true
      t.string :name
      t.string :target
      t.integer :target_id

      t.timestamps
    end
  end
end
