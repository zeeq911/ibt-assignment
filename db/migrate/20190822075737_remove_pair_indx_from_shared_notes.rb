class RemovePairIndxFromSharedNotes < ActiveRecord::Migration[5.1]
  def change
    remove_index :shared_notes, column: [:user_id,:note_id]
  end
end
