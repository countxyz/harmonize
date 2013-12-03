Harmonize::Application.routes.draw do

  root 'main_pages#home'

  resources :projects, :contacts
end
