# frozen_string_literal: true

class API::SlidesController < ApplicationController
  def index
    render json: Slide.filter_by_slide_show(params[:slide_show_id]).select(:id, :image).sort
  end
end
