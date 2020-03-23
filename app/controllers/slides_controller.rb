# frozen_string_literal: true

class SlidesController < ApplicationController
  def new
    @form = Form::SlideCollection.new
  end

  def create
    @form = Form::SlideCollection.new(slide_collection_params)
    if @form.save
      redirect_to current_user, notice: "スライドが作成されました"
    else
      render :new
    end
  end

  private
    def slide_collection_params
      params.require(:form_slide_collection).permit(slides_attributes: Form::Slide::REGISTRABLE_ATTRIBUTES)
    end
end
