class CreateStuff < ActiveRecord::Migration
  
  def self.up
    create_table :friendships do |t|
      t.integer :person_id
      t.integer :friend_id
      t.integer :messages
      t.integer :wall_posts
      
      t.timestamp :created_at
      t.timestamp :updated_at
    end
    
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :conversation_id
      t.text :body
      
      t.timestamp :created_at
    end
    
    create_table :conversations do |t|
      t.string :subject
      t.integer :first_person_id
      t.integer :second_person_id
      
      t.timestamp :created_at
      t.timestamp :updated_at
    end
    
    create_table :wall_posts do |t|
      t.integer :poster_id
      t.integer :postee_id
      t.text :body
      
      t.timestamp :created_at
    end
    
    add_column :people, :status, :string
    
    create_table :comments do |t|
      t.integer :person_id
      t.integer :item_id
      t.integer :item_type
      t.text :body
      
      t.timestamp :created_at
    end
    
  end

  def self.down
    drop_table :comments, :wall_posts, :conversations, :messages, :friendships
    remove_column :people, :status
  end
end
