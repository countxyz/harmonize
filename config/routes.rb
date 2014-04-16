Harmonize::Application.routes.draw do

  root :to => 'main_pages#sign_in'

  match '/about', to: 'main_pages#about', via: 'get'

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
