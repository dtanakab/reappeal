# frozen_string_literal: true

class AddSlideShowIdToSlides < ActiveRecord::Migration[6.0]
  def change
    add_reference :slides, :slide_show, index: true
  end
end
