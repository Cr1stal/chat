class CreateOnlineUsers < ActiveRecord::Migration
  def change
    create_table :online_users do |t|
      t.integer :user_id
      t.datetime :last_activity

      t.timestamps
    end
  end
end
