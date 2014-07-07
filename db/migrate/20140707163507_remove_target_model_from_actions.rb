class RemoveTargetModelFromActions < ActiveRecord::Migration
  def up
    remove_column :actions, :target_model
  end

  def down
    add_column :actions, :target_model, :string
  end
end
