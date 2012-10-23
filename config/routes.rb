Colimastats::Application.routes.draw do
  get 'locations/getmarkers', :controller=>'locations', :action => 'getmarkers'
  resources :locations
  root to: 'locations#index'
  get 'locations/getcities/:id', :controller=>'locations', :action => 'getcities'
  get 'locations/getlocalities/:id', :controller=>'locations', :action => 'getlocalities'
  get 'stats/show'
end
