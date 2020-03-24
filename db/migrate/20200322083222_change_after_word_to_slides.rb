# frozen_string_literal: true

class ChangeAfterWordToSlides < ActiveRecord::Migration[6.0]
  def change
    change_column_default :slides, :after_word, from: nil, to: ""
    change_column_default :slides, :before_word, from: nil, to: ""
    change_column_default :element_types, :before_word_support, from: nil, to: ""
    change_column_default :element_types, :after_word_support, from: nil, to: ""
    remove_column :element_types, :search_word_support, :string
    remove_column :element_types, :another_support, :string
  end
end
