class AddTrackableToActions < ActiveRecord::Migration
  def change
    add_column :actions, :trackable_type, :string
    add_column :actions, :trackable_id, :integer
  end
end
