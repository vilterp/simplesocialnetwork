class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => "Person", :foreign_key => "sender_id"
  belongs_to :recipient, :class_name => "Person", :foreign_key => "recipient_id" # why is that necessary?
  belongs_to :conversation
end
