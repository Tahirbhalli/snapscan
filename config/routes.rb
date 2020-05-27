Rails.application.routes.draw do
  resources :user, only: [:index,:new,:create] do
    member do
      match 'home' => 'user#home', via: [:get]
    end
    collection do
      match 'login' => 'user#login', via: [:get]
      match 'authentication' => 'user#auth', via: [:post]
    end
  end

  root 'user#index'
end
