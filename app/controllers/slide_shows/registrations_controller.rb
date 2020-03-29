# frozen_string_literal: true

class SlideShows::RegistrationsController < Devise::RegistrationsController
  protected
    def after_sign_up_path_for(resource)
      edit_slide_show_path(resource)
    end
end
