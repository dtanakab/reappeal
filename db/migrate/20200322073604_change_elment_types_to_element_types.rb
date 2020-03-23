# frozen_string_literal: true

class ChangeElmentTypesToElementTypes < ActiveRecord::Migration[6.0]
  def change
    rename_table :elment_types, :element_types
  end
end
