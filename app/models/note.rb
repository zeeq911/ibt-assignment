class Note < ApplicationRecord
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :content, presence: true
    validates :user_id, presence: true
    mount_uploader :picture, PictureUploader
    validate  :picture_size


    private
        def picture_size
            if picture.size > 5.megabytes
                errors.add(:picture, "should be less than 5MB")
            end
        end

end
