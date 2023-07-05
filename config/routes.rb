Rails.application.routes.draw do
  resources :users do
    collection do
      patch 'update_status_all'
    end
  end

  get 'api' => 'users#api'
  get 'cleaners' => 'users#cleaners'
  post 'attend' => 'users#attend'
end
