# frozen_string_literal: true

class RemoveUserIdToSlides < ActiveRecord::Migration[6.0]
  def change
    remove_column :slides, :user_id, :bigint
  end
end
