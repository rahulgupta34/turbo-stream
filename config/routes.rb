Rails.application.routes.draw do
  
  root "form_validation#form"
  post "/form/preview", to: "form_validation#preview"
end
