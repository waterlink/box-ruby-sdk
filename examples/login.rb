# add the lib directory to our require path (you do not need this if you use the box-api gem)
$: << File.dirname(__FILE__) + "/../lib"

# we use bundler to keep all of our gems up to date, but it is optional
require 'rubygems'
require 'bundler/setup'

require 'box-api'

# launchy is a simple gem that opens a browser, but is completely optional
require 'launchy'

# we save all of our app data to a file, so we don't have to hard-code values
app_data_file = File.dirname(__FILE__) + '/app_data.yml'
app_data = YAML.load_file(app_data_file)

# create an account object using the API key stored in app_data.yml
# you need to get your own API key at http://www.box.net/developers/services
account = Box::Account.new(app_data['api_key'])

# read any auth tokens if they are saved, so we don't have to re-authenticate on Box
auth_token = app_data['auth_token']

# try to authorize using the auth token, or request a new one if not
account.authorize(:auth_token => auth_token) do |auth_url|
  # this block is called if the auth_token is invalid or missing

  # we use launchy to open a new browser to the given url
  Launchy.open(auth_url)

  # wait until the user authenticates on box before continuing
  puts "Please press the enter key once you have authorized this application to use your account"
  gets
end

unless account.authorized?
  # the user didn't authorize like we told them to, so we can't access anything
  puts "Unable to login, please try again."
  exit
end

# we managed to log in successfully!
puts "Logged in as #{ account.login }"

# this is so the other example can access the account variable
@account = account

# this auth token will let us instantly authorize next time this app is run, so we save it
app_data['auth_token'] = account.auth_token

File.open(app_data_file, 'w') do |file|
  YAML.dump(app_data, file)
end
