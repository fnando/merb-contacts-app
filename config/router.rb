Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  resources :users
  resources :session
  
  #authenticate do
    resources :contacts
  #end
  
  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")
  
  match('/signup').to(:controller => 'users', :action =>'new')
  match('/').to(:controller => 'home', :action =>'index')
  
  default_routes
end