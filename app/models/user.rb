class User < ApplicationRecord

  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  validate :avatar_size_validation

  private
  def avatar_size_validation
    errors[:avatar] << "should be less than 2MB" if avatar.size > 10.megabytes
  end

end
