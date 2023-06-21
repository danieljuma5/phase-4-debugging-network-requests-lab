Rails.application.routes.draw do
  resources :toys, except: [:show]
end
