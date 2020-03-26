# frozen_string_literal: true

class SlideShowsController < ApplicationController
  before_action :set_slide_show, only: %i[show edit update]

  def show
  end

  def edit
    @slide_show.slides.build
  end

  def update
    if @slide_show.update(slide_show_params)
      SlideCollection.new(@slide_show.slides.select { |s| s.search_target? })
      redirect_to @slide_show
    else
      render :edit
    end
  end

  private
    def set_slide_show
      @slide_show = current_slide_show
    end

    def slide_show_params
      params.require(:slide_show).permit(:show_name, slides_attributes: [:element_type_id, :search_word, :before_word, :after_word, :active])
    end
end
