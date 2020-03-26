# frozen_string_literal: true

class DeviseCreateSlideShows < ActiveRecord::Migration[6.0]
  def change
    create_table :slide_shows do |t|
      t.string :show_name,          null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.timestamps null: false
    end
    add_index :slide_shows, :show_name,            unique: true
  end
end
