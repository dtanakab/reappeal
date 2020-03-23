# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "top#show"
  resources :users, only: [:new, :create, :show] do
    namespace :api, format: "json" do
      resources :slides, only: [:index]
    end
  end
end
