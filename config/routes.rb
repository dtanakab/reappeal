# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "top#show"
  resources :collects
  resources :slides
  resources :users, only: [:new, :create]
  namespace :api, format: "json" do
    resources :slides, only: [:index]
  end
end
