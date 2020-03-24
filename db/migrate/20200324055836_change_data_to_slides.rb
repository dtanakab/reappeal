# frozen_string_literal: true

class ChangeDataToSlides < ActiveRecord::Migration[6.0]
  def change
    change_column_default :slides, :search_word, from: nil, to: ""
    add_column :slides, :active, :boolean, default: false
  end
end
