class AddUserIdToEntities < ActiveRecord::Migration[7.0]
  def change
    add_column :entities, :user_id, :int
  end
end
