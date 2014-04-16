Harmonize::Application.routes.draw do

  root :to => 'projects#index'

  match '/about', to: 'main_pages#about', via: 'get'

  resources :contacts, :events

  resources :tasks, except: :show, :id => /\d+/ do
    collection do
      get :completed
    end

    member do
      post :complete
    end
  end

  resources :projects do
    resources :assignments
  end
end
