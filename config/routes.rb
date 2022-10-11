Rails.application.routes.draw do
  get 'static_page/splashscreen'
  devise_for :users
  get 'groups/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "groups#home"
end
