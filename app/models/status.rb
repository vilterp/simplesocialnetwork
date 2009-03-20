class Status < ActiveRecord::Base
  
  belongs_to :person
  
  def to_s
    self.status
  end
end