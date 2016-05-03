Rails.application.routes.draw do

  root "site#index"

  resources :owners do
    resources :pets, only: [:index, :new, :create]
  end

end

# config/routes.rb
  # resources :owners do
  #   resources :pets, only: :index
  # end
