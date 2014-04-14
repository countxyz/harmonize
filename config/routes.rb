Harmonize::Application.routes.draw do

  devise_for :users

  root :to => 'projects#index'

  match '/about', to: 'main_pages#about', via: 'get'

  resources :contacts, :events

  resources :tasks, except: :show do
    get :completed, on: :collection
  end

  resources :projects do
    resources :assignments
  end
end
