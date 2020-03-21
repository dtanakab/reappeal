# frozen_string_literal: true

class AddDetailToCollects < ActiveRecord::Migration[6.0]
  def change
    add_column :collects, :fix, :boolean, default: false
    add_column :collects, :replace, :boolean, default: false
  end
end
