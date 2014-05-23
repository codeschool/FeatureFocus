class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file_name
      t.string :file_url
      t.references :project, index: true
      t.integer :attachable_id
      t.string  :attachable_type

      t.timestamps
    end
  end
end
