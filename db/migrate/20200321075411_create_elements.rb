# frozen_string_literal: true

class CreateElements < ActiveRecord::Migration[6.0]
  def change
    create_table :elements do |t|
      t.string :search_word
      t.string :before_word
      t.string :after_word
      t.timestamps
    end
  end
end
