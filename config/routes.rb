Harmonize::Application.routes.draw do
  root 'users#show'

  get '/about', to: 'main_pages#about'

  get    '/signin',  to: 'sessions#new'
  post   '/signin',  to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:new, :create, :destroy]

  resources :accounts, :users

  resources :contacts, except: :edit
  resources :events,   except: :show



  resources :tasks, except: :show do
    get :completed, on: :collection
  end

  resources :users, except: :destroy do
    get :stats, on: :member
  end

  namespace :admin do
    root 'dashboard#index'

    resources :users
  end
end
