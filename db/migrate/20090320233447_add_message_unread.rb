class AddMessageUnread < ActiveRecord::Migration
  def self.up
    add_column :messages, :unread, :boolean
  end

  def self.down
    remove_column :messages, :unread
  end
end
