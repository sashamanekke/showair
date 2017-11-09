Rails.application.routes.draw do
  get 'availibilities/new'

  get 'availibilities/create'

  mount Attachinary::Engine => "/attachinary"
  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :showers do
    resources :reservations, only: [:show, :create, :new, :index]
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
