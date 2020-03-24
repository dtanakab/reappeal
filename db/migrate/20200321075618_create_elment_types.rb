# frozen_string_literal: true

class CreateElmentTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :elment_types do |t|
      t.string :column_name
      t.string :search_word_support
      t.string :before_word_support
      t.string :after_word_support
      t.string :another_support
      t.timestamps
    end
  end
end
