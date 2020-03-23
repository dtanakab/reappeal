# frozen_string_literal: true

class Api::SlidesController < ApplicationController
  def index
    render json: Slide.filter_by_user(params[:user_id]).select(:image)
  end
  private
    def slides_params
      params.require(:slide).permit(:user_id)
    end
end
