Rails.application.routes.draw do

  root to: 'pairings#new'
  
  resources :pairings do
    resources :foods
  end

  resources :wines
end
