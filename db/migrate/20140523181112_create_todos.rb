class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.references :project, index: true

      t.timestamps
    end
  end
end
