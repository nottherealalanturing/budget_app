Rails.application.routes.draw do
  
  get 'static_page/splashscreen'
  
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'        
  end
  
  get 'groups/index', as: :user_root

  resources :users do
    resources :groups do
      resources :trades
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_page#splashscreen"
end
