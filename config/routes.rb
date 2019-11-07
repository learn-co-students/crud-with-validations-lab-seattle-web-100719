Rails.application.routes.draw do
  resources :songs
  # get "/songs/:id/destroy", to: "songs#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
