Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'ships#index'
  # resources :ships, only: index do
  #   resources :occurrences, only: :index
  # end

  resources :users do
    resources :occurrences, only: %i[index show new create]
  end
end
