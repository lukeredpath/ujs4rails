# As you can see you'll need to run these tesxts in the context of a Rals application
# as it requires the whole environment to be loaded.'

require 'test/unit'
require File.join(File.dirname(__FILE__), 'ptk_helper')
require 'test_help'
require 'stubba'
require 'stubs/controller_stub'

# load plugin files
require 'actionview_helpers_patches'
require 'prototype_helper_patches'
require 'scriptaculous_helper_patches'
require 'asset_tag_helper_patches'
require 'tag_helper_patches'
require 'behaviour_caching'
require 'unobtrusive_javascript'

$:.unshift(File.join(File.dirname(__FILE__), '../lib/'))

def initialize_test_request
  @controller = ControllerStub.new
  @request = ActionController::TestRequest.new
  @response = ActionController::TestResponse.new
  get :index
end