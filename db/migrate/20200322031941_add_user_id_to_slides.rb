# frozen_string_literal: true

class AddUserIdToSlides < ActiveRecord::Migration[6.0]
  def change
    add_reference :slides, :user, index: true
  end
end
