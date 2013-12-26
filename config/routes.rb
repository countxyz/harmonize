Harmonize::Application.routes.draw do

  root :to => 'events#index'

  resources :projects, :contacts, :events
end
