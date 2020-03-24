# frozen_string_literal: true

class CreateSlides < ActiveRecord::Migration[6.0]
  def change
    create_table :slides do |t|
      t.string :search_word
      t.string :before_word
      t.string :after_word
      t.string :image
      t.timestamps
    end
  end
end
