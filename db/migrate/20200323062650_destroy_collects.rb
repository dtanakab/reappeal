# frozen_string_literal: true

class DestroyCollects < ActiveRecord::Migration[6.0]
  def change
    drop_table :collects
    drop_table :image_urls
  end
end
