# frozen_string_literal: true

class AddElementTypeIdToSlides < ActiveRecord::Migration[6.0]
  def change
    add_reference :slides, :element_type, index: true
  end
end
