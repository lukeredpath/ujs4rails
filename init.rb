require 'actionview_helpers_patches'
require 'prototype_helper_patches'
require 'scriptaculous_helper_patches'
require 'asset_tag_helper_patches'
require 'tag_helper_patches'
require 'behaviour_caching'
require 'unobtrusive_javascript'

# make plugin controllers and views available to app
config.load_paths += %W(#{UnobtrusiveJavascript::PLUGIN_CONTROLLER_PATH})
Rails::Initializer.run(:set_load_path, config)

# add methods to action controller base
ActionController::Base.send(:include, UnobtrusiveJavascript::ControllerMethods)

# load in the helpers and caching code
ActionController::Base.send(:helper, UnobtrusiveJavascript::Helpers)
ActionController::Base.send(:include, UnobtrusiveJavascript::BehaviourCaching)

# require the controller
require 'unobtrusive_javascript_controller'