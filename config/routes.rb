# frozen_string_literal: true

Rails.application.routes.draw do
  resources :registration_forms, except: :show
  resources :sport_types
  resources :partners
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
