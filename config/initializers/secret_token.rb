# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
secret = 'bbce0fd228b64bbec1af65ccd8e1bb813938d34cdd65b929d663ef691e8aa1aeea170d087e3d5fe94bb57e503f635c0f789a1922f250c7d1d12ffbeb427ae409'

if secret.nil? || secret.length < 30
  puts 'secret token cannot be loaded'
else 
  OrderSupplies::Application.config.secret_key_base = secret
end	