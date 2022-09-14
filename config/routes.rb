Rails.application.routes.draw do

  root "dropdown#country"
  get "/state", to: "dropdown#state"
  get "/city", to: "dropdown#city"
end
