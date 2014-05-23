class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.references :project, index: true

      t.timestamps
    end
  end
end
