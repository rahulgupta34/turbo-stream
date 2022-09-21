Rails.application.routes.draw do
  resources :users do
    member do
      post :edit
    end

    collection do
       post :search       
    end
  end
  
  root "users#index"
end
