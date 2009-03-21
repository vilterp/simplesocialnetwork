class ChangeUnreadFormat < ActiveRecord::Migration
  def self.up
    Message.all.each do |m|
      m.unread = m.unread ? 1 : 0
      m.save
    end
    change_column :messages, :unread, :boolean, :default => 1
  end

  def self.down
    Message.each do |m|
      m.unread = m.unread ? true : false
      m.save
    end
    change_column :messages, :unread, :boolean, :default => true
  end
end
