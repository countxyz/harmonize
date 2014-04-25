Harmonize::Application.routes.draw do
  root 'tasks#index'

  get    '/signup',  to: 'users#new'
  get    '/signin',  to: 'sessions#new'
  post   '/signin',  to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  get '/about', to: 'main_pages#about'

  resources :sessions, only: [:new, :create, :destroy]

  resources :contacts, :events, :users

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
