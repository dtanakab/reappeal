class DestroyPersonTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :persons
  end
end
