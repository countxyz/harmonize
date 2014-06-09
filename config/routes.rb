Harmonize::Application.routes.draw do
  root 'contacts#index'

  get '/about', to: 'main_pages#about'

  get    '/signin',  to: 'sessions#new'
  post   '/signin',  to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users
  end

  resources :accounts, :users

  resources :contacts, except: :edit

  resources :projects do
    resources :assignments
  end

  resources :tasks, except: :show, :id => /\d+/ do
    collection do
      get :completed
    end

    member do
      post :complete
    end
  end
end
