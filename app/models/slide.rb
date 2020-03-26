# frozen_string_literal: true

class Slide < ApplicationRecord
  belongs_to :slide_show
  belongs_to :element_type
  mount_uploader :image, ImagesUploader

  scope :filter_by_slide_show, ->(slide_show_id) do
    where(slide_show_id: slide_show_id, active: true).where.not(image: nil) if slide_show_id
  end

  def arranged_text
    if element_type.id == 1
      search_word
    else
      element_type.column_name + "：\n" + search_word + before_word + after_word
    end
  end

  def image_url
    CGI.unescape(image.url)
  end

  def search_target?
    active == true && search_word != ""
  end
end
