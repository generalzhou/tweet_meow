# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'faker'
require 'erb'
require 'bcrypt'
require 'twitter'

CONSUMER_KEY = 'VbWnpCvp2H2W8bW1Aj2gpw'
CONSUMER_SECRET = 'UQSZDY7snm9If1FUfClgPLwALc1MMRcGVEP7CY0pK4'
OAUTH_TOKEN = '256847396-A7c2F48G369Eev1zIuFagqFJHzw9asmiMeuWY4iL'
OAUTH_SECRET = 'SNuzlqRB2XOD0vm94qkbO56Z5NYOOve77wTaqNEMGs'

Twitter.configure do |config|
  config.consumer_key = CONSUMER_KEY
  config.consumer_secret = CONSUMER_SECRET
  config.oauth_token = OAUTH_TOKEN
  config.oauth_token_secret = OAUTH_SECRET
end


# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s
set :root, APP_ROOT
# require 'carrierwave'
# require 'carrierwave/orm/activerecord'

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'uploaders', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')
