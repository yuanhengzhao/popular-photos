Rails.application.routes.draw do
  get 'photos/popular'
  root 'photos#popular'
  # get '/auth/:provider', as: "login"
  get '/auth/:provider/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
