Rails.application.routes.draw do
  
  root "modal_hotwire#index"
  post "/", to: "modal_hotwire#create"
end
