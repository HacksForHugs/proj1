Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  
  resources :trainers do
  	resources :pokemons, shallow: true
  end


	put '/pokemons/:id', to: 'pokemons#damage', as: 'damage'
  patch '/', to: 'pokemons#capture', as: 'capture'

  
end
