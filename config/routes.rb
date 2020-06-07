Rails.application.routes.draw do
  resources :user,only:[:new,:create,:index] do
    collection do
      match '/login' => 'user#login',via:[:get]
      match 'authentication' => 'user#auth', via: [:post]
    end
  end
  namespace :account do
    resources :profile,only: [:index] do
      collection do
        match '/logout' => 'profile#destroy',via:[:get]
      end
      resources :transactions,only: [:index,:new,:create] do
        collection do
          match '/external' => 'transactions#external', via:[:get]
          match '/join' => 'transactions#join',via:[:get]
        end
      end
      resources :group,only: [:index,:new,:create] do
        match '/join' => 'group#join', via:[:get]
        match '/transactions'=>'group#grouptransactions',via:[:get]
        match '/add' => 'group#add', via:[:get]
        match '/added' => 'group#added',via:[:post]
        
      end
    end
  end

  root "user#index"

end
