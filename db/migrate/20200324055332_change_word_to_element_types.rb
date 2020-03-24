# frozen_string_literal: true

class ChangeWordToElementTypes < ActiveRecord::Migration[6.0]
  def change
    remove_column :element_types, :before_word_support, :string
    remove_column :element_types, :after_word_support, :string
  end
end
