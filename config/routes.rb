Rails.application.routes.draw do
  resources :courts

  root "courts#index"
end
