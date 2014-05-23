class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.references :owner, index: true

      t.timestamps
    end
  end
end
