class DropStatuses < ActiveRecord::Migration
  def self.up
    drop_table :statuses
  end

  def self.down
    create_table "statuses", :force => true do |t|
      t.integer  "person_id"
      t.string   "status"
      t.datetime "created_at"
    end
  end
end
