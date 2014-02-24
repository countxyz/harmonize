Harmonize::Application.routes.draw do

  root :to => 'dashboard#index'
  match '/about', to: 'main_pages#about', via: 'get'

  resources :projects, :contacts, :events
end
