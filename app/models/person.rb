require 'digest/sha1'

class Person < ActiveRecord::Base
  
  has_many :comments, :foreign_key => "commenter_id"
  has_many :conversations, :through => "conversation_memberships"
  has_many :wall_posts, :foreign_key => "postee_id"
  has_many :wall_posts_posted, :class_name => "WallPost", :foreign_key => "poster_id"
  has_many :messages_sent, :class_name => "Message", :foreign_key => "sender_id"
  has_many :messages_received, :class_name => "Message", :foreign_key => "recipient_id"
  has_many :statuses
  
  def to_s
    self.name
  end
  
  def set_status(status)
    self.status = status
    Status.create :stauts => status do |s|
      s.person = self
    end
  end
  
  # restful_authentication stuff from here down
  
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :email, :name, :password, :password_confirmation



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(email, password)
    return nil if email.blank? || password.blank?
    u = find_by_email(email) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  protected
    


end
