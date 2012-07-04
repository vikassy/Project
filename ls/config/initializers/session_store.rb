# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ls_session',
  :secret      => 'afdf095d62730ff8da83f5f4d97ba7e53ff5f2f48cf7ededda8aca21bdacf3583efd928188ad1daaa5a65461532123cd60702eb7f57ac4abbbc720a751626114'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
