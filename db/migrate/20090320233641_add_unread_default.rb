class AddUnreadDefault < ActiveRecord::Migration
  def self.up
    change_column :messages, :unread, :boolean, :default => true
    Message.all.each do |m|
      m.unread = false
      m.save
    end
  end

  def self.down
    change_column :messages, :unread, :boolean, :default => nil # ...?
  end
end
