Rails.application.routes.draw do
  
  root "checkbox#index"
  delete "/checkbox/destroy", to: "checkbox#destroy"
  
end
