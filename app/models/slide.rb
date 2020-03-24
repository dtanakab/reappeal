# frozen_string_literal: true

class Slide < ApplicationRecord
  belongs_to :user
  belongs_to :element_type
  mount_uploader :image, ImagesUploader

  scope :filter_by_user, ->(user_id) { where(user_id: user_id, active: true) if user_id }

  def arranged_text
    if element_type.id == 1
      search_word
    else
      element_type.column_name + "：\n" + search_word + before_word + after_word
    end
  end

  def image_url
    CGI.unescape("public" + image.url)
  end
end
