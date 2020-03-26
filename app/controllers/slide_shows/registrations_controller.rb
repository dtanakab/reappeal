# frozen_string_literal: true

class SlideShows::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    super
  end

  def create
    super
  end

  # protected

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    edit_slide_show_path(resource)
  end
end
