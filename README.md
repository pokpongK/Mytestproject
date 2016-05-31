# Mytestproject
My test project
run bundle install
run bundle update
install Figaro gem
in config/aplication.yml set env variable as follow

FACEBOOK_KEY: #facebook dev key
FACEBOOK_SECRET: #facebook app secret 

create config/secret.yml
input as follow

development:
  secret_key_base:..... 
test:
  secret_key_base:..... 

production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
  
  
install imaage  processor for paperclip gem (see requirement in paperclip gem)