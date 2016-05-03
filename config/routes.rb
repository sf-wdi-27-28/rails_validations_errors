Rails.application.routes.draw do

  root "site#index"

  resources :owners do
    resources :pets, :index, :show
  end

end
