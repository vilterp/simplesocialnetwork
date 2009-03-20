class WallPost < ActiveRecord::Base
  belongs_to :poster, :class_name => "Person"
  belongs_to :postee, :class_name => "Person"
end
