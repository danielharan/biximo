# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_biximo_session',
  :secret      => 'a3c8af0a3264e9195a47753bed6dd6bb6a4bde009d0240909342c429db245f1c1b27737b17624cc226d1f8cbe45cf9f83e582de22084bb927ed62f5550a66999'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
