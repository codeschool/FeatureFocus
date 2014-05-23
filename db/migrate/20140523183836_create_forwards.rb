class CreateForwards < ActiveRecord::Migration
  def change
    create_table :forwards do |t|
      t.text :body
      t.references :project, index: true

      t.timestamps
    end
  end
end
