class AddUserIdToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :user_id, :int
  end
end
