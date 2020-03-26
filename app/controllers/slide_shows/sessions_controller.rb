# frozen_string_literal: true

class SlideShows::SessionsController < Devise::SessionsController
  protected
    def after_sign_in_path_for(resource)
      resource
    end

    def after_sign_out_path_for(resource)
      new_slide_show_registration_path
    end
end
