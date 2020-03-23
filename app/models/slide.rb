# frozen_string_literal: true

class Slide < ApplicationRecord
  belongs_to :user
  belongs_to :element_type
  mount_uploader :image, ImagesUploader

  scope :filter_by_user, ->(user_id) { where(user_id: user_id) if user_id }

  def arrange_text(type)
    if type.id == 1
      search_word
    elsif type.id <= 5
      type.column_name + "：\n" + search_word + "\n(" + after_word + type.after_word_support + ")"
    elsif element_type.id <= 7
      type.column_name + "：\n" + search_word + before_word + "\n(" + after_word + type.after_word_support + ")"
    else
      type.column_name + "：" + search_word
    end
  end
end
