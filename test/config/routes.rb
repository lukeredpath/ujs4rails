ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/:action/:id'
  UnobtrusiveJavascript::routes
end