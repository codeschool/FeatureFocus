class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :body
      t.references :project, index: true

      t.timestamps
    end
  end
end
