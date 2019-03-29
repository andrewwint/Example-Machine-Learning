Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "guesses#index"
  get '/report', to: 'guesses#show', as: 'report'
  resources :guesses, only: [:create]
  get '/animal/:height/:weight', to: 'heights#animal', as: 'animal'
  get '/chart', to: 'animal_height_weights#index', as: 'chart'
end
