Rails.application.routes.draw do
  resources :courts

  get "hello_world", to: "hello_world#index"
  root "courts#index"
end
