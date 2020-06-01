Rails.application.routes.draw do
  resources :user, only: [:index,:new,:create] do
    collection do
      match '/login' => 'user#login', via: [:get]
      match 'authentication' => 'user#auth', via: [:post]
    end
  end
  resources :profile, only: [:index] do
    member do
     match '/all/transactions' => 'profile#transactions',via: [:get]
    end
    collection do
      match '/logout' => 'profile#logout', via: [:get]
    end
  end
  root 'user#index'
end
