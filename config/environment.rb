# Load the Rails application.
require File.expand_path('../application', __FILE__)

require 'casclient'
require 'casclient/frameworks/rails/filter'

# Initialize the Rails application.
Rails.application.initialize!
  CASClient::Frameworks::Rails::Filter.configure(
    :cas_base_url => "https://cas-dev.tamu.edu/cas",
    :enable_single_sign_out => true,
    :authenticate_on_every_request => true
  )