Rails.application.routes.draw do
  resources :users do
    member do
      post :edit
    end
  end
  
  root "users#index"
end
