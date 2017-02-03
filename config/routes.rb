Rails.application.routes.draw do


  resources :pairings do
    resources :foods
  end

  resources :wines
end
