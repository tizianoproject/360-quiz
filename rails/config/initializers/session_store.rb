# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tizquiz_session',
  :secret      => '9b615ee2be6b19bb225f2068def337220f0c16f9176bb8a9070bc7da88b0448914fa6b97d49808d3c225cd7e85bff7dd93281066877d31a14ad15fc7c61b5737'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
