ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'people', :action => 'create'
  map.signup '/', :controller => 'people', :action => 'new'
  map.resources :people

  map.resource :session

end
