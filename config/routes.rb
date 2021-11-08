Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'occurrences#index'
  resources :ships do
    member do
      delete :delete_image_attachment
    end
  end

  resources :occurrences
end
