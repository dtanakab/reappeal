# frozen_string_literal: true

class AddUrlToCollects < ActiveRecord::Migration[6.0]
  def change
    add_column :collects, :url, :string
  end
end
