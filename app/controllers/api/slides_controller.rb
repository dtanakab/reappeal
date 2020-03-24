# frozen_string_literal: true

class Api::SlidesController < ApplicationController
  def index
    render json: Slide.filter_by_user(params[:user_id]).select(:image)
  end
end
