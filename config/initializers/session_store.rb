# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Feed-Search_session',
  :secret      => '5ad60606609afa52029ba94bb4b21692fff915908b63e722b3883f7adcc08556b239157235040c57ac1c8fe7768f5b478629470da9c3ffc009f9cd320dda95bc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
