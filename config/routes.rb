Harmonize::Application.routes.draw do

  root :to => 'projects#index'
  match '/about', to: 'main_pages#about', via: 'get'

  resources :contacts, :tasks, :events

  resources :projects do
    resources :assignments
  end
end
