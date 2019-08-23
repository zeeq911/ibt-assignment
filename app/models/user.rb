class User < ApplicationRecord
  mount_uploader :profile_picture, ProfilePictureUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :notes, dependent: :destroy
  has_many :shared_notes, dependent: :destroy,foreign_key: "user_id"
  validate  :profile_picture_size


  private
      def profile_picture_size
          if :profile_picture.size > 5.megabytes
              errors.add(:profile_picture, "should be less than 5MB")
          end
      end
end
