class RemoveOwneridFromNotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :notes, :owner_id, :integer
  end
end
