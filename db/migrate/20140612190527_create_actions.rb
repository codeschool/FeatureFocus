class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :project, index: true
      t.references :user, index: true
      t.string :target_model

      t.timestamps
    end
  end
end
