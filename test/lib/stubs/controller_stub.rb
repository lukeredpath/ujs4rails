require 'action_controller/test_process'
require 'unobtrusive_javascript/controller_methods'

class ControllerStub < ActionController::Base
  def index
    render :nothing => true
  end
end

ControllerStub.send(:include, UnobtrusiveJavascript::ControllerMethods)