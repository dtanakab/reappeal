# frozen_string_literal: true

Rails.application.routes.draw do
  root "top#show"
  devise_for :slide_shows, controllers: {
    registrations: "slide_shows/registrations",
    sessions: "slide_shows/sessions"
  }
  resources :slide_shows, only: [:show, :edit, :update] do
    namespace :api, format: "json" do
      resources :slides, only: [:index]
    end
  end
  mount ActionCable.server => "/cable"
end
