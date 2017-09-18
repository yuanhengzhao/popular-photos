Rails.application.routes.draw do
  get 'photos/popular'
  root 'photos#popular'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
