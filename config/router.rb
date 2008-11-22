Merb.logger.info("Compiling routes...")
Merb::Router.prepare do
  resources :users
  resources :session
  
  #authenticate do
    resources :contacts
  #end
  
  slice(:merb_auth_slice_password, :name_prefix => nil, :path_prefix => "")
  default_routes
  
  match('/signup').to(:controller => 'users', :action =>'new')
  match('/').to(:controller => 'home', :action =>'index')
end