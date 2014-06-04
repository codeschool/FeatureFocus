class AddBodyToAction < ActiveRecord::Migration
  def change
    add_column :actions, :body, :text
  end
end
