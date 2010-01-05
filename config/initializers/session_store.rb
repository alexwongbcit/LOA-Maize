# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Website_session',
  :secret      => 'd627580b884de75d4483a6d58257a4c614421015d78af3b7824cd169da62af93c94914f3adad246293c3e8d67c8a52ecf660cfeab14bf0a9e42461b676627427'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
