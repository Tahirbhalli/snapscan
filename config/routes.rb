Rails.application.routes.draw do
  root 'user#index'
  resources :user, only: [:index,:new,:create] do
    collection do
      match '/login' => 'user#login', via: [:get]
      match 'authentication' => 'user#auth', via: [:post]
    end
  end
  resources :profile, only: [:index,:create] do
    member do
     match '/all/transactions' => 'profile#transactions', via: [:get]
     match 'external/transaction' => 'profile#external', via: [:get]
     match '/all/groups' => 'profile#groups', via: [:get]
     match '/new/tansaction' => 'profile#new', via: [:get]
     match '/new/group' => 'profile#newgroup', via: [:get]
     match '/join' => 'profile#join', via:[:get]
     match '/add_transaction' => 'profile#add', via: [:get]
     match '/added' => 'profile#added', via: [:get]
     match '/group-tansaction' => 'profile#grouptrans', via: [:get]
    end
    collection do
      match '/create_group' => 'profile#group_create', via: [:post]
      match '/logout' => 'profile#logout', via: [:get]
    end
  end
end
