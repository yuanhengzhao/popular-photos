Rails.application.routes.draw do
  get 'photos/popular'
  post 'photos/:id/like', to: 'photos#like', as: 'like_photo'
  delete 'photos/:id/unlike', to: 'photos#unlike', as: 'unlike_photo'
  root 'photos#popular'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
