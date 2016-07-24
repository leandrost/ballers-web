Rails.application.routes.draw do
  resources :courts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "courts#index"
end
