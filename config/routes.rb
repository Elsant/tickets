Rails.application.routes.draw do

  admin_constraint = lambda do |request|
    request.env['warden'].authenticate? && request.env['warden'].user.admin?
  end

  constraints admin_constraint do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  devise_for :users
  
  resources :tickets, only: :index do
    get 'export', on: :collection
  end

  root 'tickets#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
