class Comment < ActiveRecord::Base
  belongs_to :commenter, :class_name => "Person"
  belongs_to :item, :polymorphic => true
end
