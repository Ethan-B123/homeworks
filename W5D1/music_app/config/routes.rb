Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i(new create show index)
  resource :session, only: %i(new create destroy)

  resources :bands, only: %i(index show new create edit update destroy)
  resources :albums, only: %i(show new create edit update destroy)
end


#      Prefix Verb   URI Pattern            Controller#Action
#       users GET    /users(.:format)       users#index
#             POST   /users(.:format)       users#create
#    new_user GET    /users/new(.:format)   users#new
#        user GET    /users/:id(.:format)   users#show
# new_session GET    /session/new(.:format) sessions#new
# session     DELETE /session(.:format)     sessions#destroy
#             POST   /session(.:format)     sessions#create
