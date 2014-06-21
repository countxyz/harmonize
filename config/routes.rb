Harmonize::Application.routes.draw do
  root 'accounts#index'

  get '/about', to: 'main_pages#about'

  get    '/signin',  to: 'sessions#new'
  post   '/signin',  to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:new, :create, :destroy]

  resources :accounts, :users

  resources :contacts, except: :edit

  resources :tasks, except: :show, :id => /\d+/ do
    collection do
      get :completed
    end

    member do
      post :complete
    end
  end

  namespace :admin do
    root 'base#index'

    resources :users
  end
end
