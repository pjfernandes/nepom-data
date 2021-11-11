Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  resources :users do
    resources :occurrences, only: %i[new create]
  end
  resources :occurrences, only: %i[index show]

  resources :members do
    member do
      delete :delete_image_attachment
    end
    resources :crews, only: %i[new create index]
  end

  resources :ships do
    member do
      delete :delete_image_attachment
    end
    resources :crews, only: %i[new create index]
  end

  resources :crews, only: %i[index show edit update delete]

end
