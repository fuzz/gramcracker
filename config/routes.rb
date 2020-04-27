Rails.application.routes.draw do
  resource :dashboard

  resources :posts do
    collection do
      get 'popular'
    end

    member do
      post 'like' 
      post 'email'
    end
  end

  devise_for :users

  root to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
