class RenameConversationMemberships < ActiveRecord::Migration
  def self.up
    rename_table :conversation_memberships, :conversations_people
  end

  def self.down
    rename_table :conversations_people, :conversation_memberships
  end
end
