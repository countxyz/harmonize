Harmonize::Application.routes.draw do

  root :to => 'dashboard#index'

  resources :projects, :contacts, :events
end
