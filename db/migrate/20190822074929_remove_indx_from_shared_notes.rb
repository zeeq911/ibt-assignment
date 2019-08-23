class RemoveIndxFromSharedNotes < ActiveRecord::Migration[5.1]
  def change
    remove_index :shared_notes, column: [:note_id, :user_id]
    add_index :shared_notes, [:user_id,:note_id], unique: true
  end
end
