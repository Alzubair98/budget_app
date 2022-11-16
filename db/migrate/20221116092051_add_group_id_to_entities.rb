class AddGroupIdToEntities < ActiveRecord::Migration[7.0]
  def change
    add_column :entities, :group_id, :int
  end
end
