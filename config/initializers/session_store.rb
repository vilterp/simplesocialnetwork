# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_simplesocialnetwork_session',
  :secret      => 'f561145a0cc121c3f71fc1433bb5811425ad21ccf0f500d9d5384a276af8b371fb780f7e61f6907dc9be3dff83b7275806178cf9c5c08eb64228160d517b3a88'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
