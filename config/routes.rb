Rails.application.routes.draw do
  resources :users do
    collection do
      patch 'update_status_all'
    end
  end

  get 'api' => 'users#api'
  get 'roulette' => 'users#roulette'
  post 'attend' => 'users#attend'

  post 'logs/create' => "logs#create"
  resources :logs 

  resources :places, only: [:show]

end
