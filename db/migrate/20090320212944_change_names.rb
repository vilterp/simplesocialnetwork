class ChangeNames < ActiveRecord::Migration
  def self.up
    rename_column :comments, :person_id, :commenter_id
    
    # ugh
    create_table :conversation_memberships do |t|
      t.integer :conversation_id
      t.integer :person_id
    end
    
    change_table :conversations do |t|
      t.remove :first_person_id
      t.remove :second_person_id
    end
    
    add_column :messages, :recipient_id, :integer
    
    create_table :statuses do |t|
      t.integer :person_id
      t.string :status
      t.timestamp :created_at
    end
  end

  def self.down
    remove_table :conversation_memberships
    change_table :conversations do |t|
      t.integer :first_person_id
      t.integer :second_person_id
    end
    rename_column :comments, :person_id, :commenter_id
    remove_column :messages, :recipient_id
    drop_table :statuses
  end
end
