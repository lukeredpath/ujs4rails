require File.dirname(__FILE__) + '/test_helper'
require 'prototype_helper_patches'
require 'scriptaculous_helper_patches'
require 'unobtrusive_javascript/behaviour_helper'

class MakeSortableTest < Test::Unit::TestCase
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::ScriptaculousHelper
  include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include UnobtrusiveJavascript::BehaviourHelper
  
  def setup
    initialize_test_request
  end
  
  def test_should_output_sortable_javascript
    output = make_sortable
    
    assert_equal sortable_element_js(javascript_variable('this')), output
  end
  
  def test_should_pass_arguments_through
    output = make_sortable :onUpdate => 'function() { alert("updated") }'
    assert_equal 'Sortable.create(this, {onUpdate:function() { alert("updated") }});', output
  end
end

class MakeRemoteLinkTest < Test::Unit::TestCase
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::ScriptaculousHelper
  include ActionView::Helpers::PrototypeHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include UnobtrusiveJavascript::BehaviourHelper
  
  def setup
    initialize_test_request
  end
  
  def test_should_default_to_element_href
    output = make_remote_link
    assert_equal '', output
  end
  
end