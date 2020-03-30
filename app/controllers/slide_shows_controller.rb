# frozen_string_literal: true

class SlideShowsController < ApplicationController
  before_action :set_slide_show, only: %i[show edit update]
  before_action :require_authentication

  def show
  end

  def edit
    require_empty_image_slides
  end

  def update
    if @slide_show.update(slide_show_params)
      slides = @slide_show.slides.select { |s| s.search_target? }
      ImageProcessorJob.perform_later(slides) if slides.any?
      redirect_to @slide_show
    else
      render :edit
    end
  end

  private
    def set_slide_show
      @slide_show = SlideShow.find(params[:id])
    end

    def slide_show_params
      params.require(:slide_show).permit(:show_name, slides_attributes: [:element_type_id, :search_word, :before_word, :after_word, :active])
    end

    def require_empty_image_slides
      if @slide_show.slides.any?
        redirect_to @slide_show, alert: "すでにスライドショーを作成済みです"
      else
        @slide_show.slides.build
      end
    end

    def require_authentication
      if @slide_show != current_slide_show
        redirect_to root_path, alert: "スライドショーIDとパスワードの入力が必要です"
      end
    end
end
