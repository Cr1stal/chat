class AddColumnActiveToUser < ActiveRecord::Migration
  def up
    add_column :users, :active_user, :boolean, :default => "true"
  end

  def down
    remove_column :users, :active_user
  end
end
