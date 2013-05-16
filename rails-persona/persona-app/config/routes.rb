PersonaApp::Application.routes.draw do
  resources :users

  get "home/index"
  get "home/secret"

  root to: 'home#index'
end
