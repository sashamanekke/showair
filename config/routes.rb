Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :showers do
    resources :reservations, only: [:show, :create, :new]
  end
  resources :users, only: [:show]
end

# show
# create
# new
# edit
# update
# index
# destroy
