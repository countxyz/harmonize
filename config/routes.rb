Harmonize::Application.routes.draw do

  root :to => 'projects#index'
  match '/about', to: 'main_pages#about', via: 'get'

  resources :projects, :contacts, :events
end
