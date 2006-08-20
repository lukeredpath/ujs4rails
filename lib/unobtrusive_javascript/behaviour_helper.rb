module UnobtrusiveJavascript
  # The helper methods in this module can all be passed as arguments to apply_behaviour and allow
  # you to reproduce common functionailty such as drag and drop and sorting in a simple way.  Think
  # of them as the apply_javascript equivilent to the Scriptaculous helpers.
  #
  # Usage:
  #
  #    apply_behaviour '.products', make_draggable
  #    apply_behaviour '.help', make_remote_link( :action => 'showhelp' )
  #    apply_behaviour '.todolist', make_sortable
  #
  module BehaviourHelper    
    
    def make_remote_link(options={})
      options[:url] ||= javascript_variable('this.href');
      "this.observe('click', function(event) {\n#{remote_function(options)};\nreturn false;\n});"
    end
    
    def make_remote_form(options={})
      options[:url] ||= javascript_variable('this.action');
      "this.observe('submit', function(event) {\n#{remote_function(options)};\nreturn false;\n});"
    end
    
    def make_observed_form(options={})
      if options[:frequency] && options[:frquency] > 0
        build_observer_js('Form.EventObserver', javascript_variable('this'), options)
      else
        build_observer_js('Form.Observer', javascript_variable('this'), options)
      end
    end
    
    def make_observed_field(options={})
      if options[:frequency] && options[:frquency] > 0
        build_observer_js('Form.Element.EventObserver', javascript_variable('this'), options)
      else
        build_observer_js('Form.Element.Observer', javascript_variable('this'), options)
      end
    end
    
    # Makes the children of the element sortable.
    def make_sortable(options={})
      sortable_element_js(javascript_variable('this'), options)
    end
    
    # Makes the element draggable.
    def make_draggable(options={})
      draggable_element_js(javascript_variable('this'), options)
    end
    
    # Makes the element a drop target.
    def make_drop_recieving(options={})
      drop_recieving_element_js(javascript_variable('this'), options)
    end
    
    def make_autocomplete
    end
    
    def make_in_place_editor
    end
    
  end
end