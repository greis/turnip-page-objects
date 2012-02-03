TurnipPageObject::Application.routes.draw do
  resources :search
  root to: 'home#index'
end
