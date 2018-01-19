class CreateStrideGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :stride_groups do |t|
      t.string :cloud_id
      t.string :group_id
      t.string :name
      t.time :starts_at
      t.text :message
      t.integer :action_type
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
