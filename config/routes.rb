Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'carrier/:name/tracking/:numbers', to: 'tracking#show'
end
