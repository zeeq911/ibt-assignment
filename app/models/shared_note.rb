class SharedNote < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true, uniqueness: { scope: :note_id }
    validates :note_id, presence: true
end
