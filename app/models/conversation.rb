class Conversation < ActiveRecord::Base
  has_and_belongs_to_many :people
  has_many :messages
end
