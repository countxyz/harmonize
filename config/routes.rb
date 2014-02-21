Harmonize::Application.routes.draw do

  mount Dashing::Engine, at: Dashing.config.engine_path
  root :to => 'dashboard#index'
  match '/about', to: 'main_pages#about', via: 'get'

  resources :projects, :contacts, :events
end
