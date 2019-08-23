class CreateSharedNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :shared_notes do |t|
      t.integer :note_id
      t.integer :user_id

      t.timestamps
    end
    add_index :shared_notes, :note_id
    add_index :shared_notes, :user_id
    add_index :shared_notes, [:note_id, :user_id], unique: true

  end
end
