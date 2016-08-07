class User < ApplicationRecord
  has_one :collection, as: :parent

  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of   :avatar, on: :update
  validates_integrity_of  :avatar, on: :update
  validates_processing_of :avatar, on: :update

  validate :avatar_size_validation, on: :update

  private
  def avatar_size_validation
    errors[:avatar] << "should be less than 2MB" if avatar.size > 10.megabytes
  end

end
