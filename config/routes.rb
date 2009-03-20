ActionController::Routing::Routes.draw do |map|
  
  map.resources :people
  map.home '/home', :controller => 'people', :action => 'home'
  
  # restful_authentication
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'people', :action => 'create'
  map.signup '/', :controller => 'people', :action => 'new'

  map.resource :session

end
