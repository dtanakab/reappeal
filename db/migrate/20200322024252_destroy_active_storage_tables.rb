# frozen_string_literal: true

class DestroyActiveStorageTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :active_storage_attachments
    drop_table :active_storage_blobs
    drop_table :elements
  end
end
