# frozen_string_literal: true

class CreateCollects < ActiveRecord::Migration[6.0]
  def change
    create_table :collects do |t|
      t.string :name
      t.string :file_name

      t.timestamps
    end
  end
end
