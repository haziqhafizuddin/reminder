Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'stride_data', to: 'pages#stride_data'
  resources :stride_groups, only: [:edit, :update]
end
