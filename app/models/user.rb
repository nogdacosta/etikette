class User < ApplicationRecord
  after_create :generate_default_collection

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

  acts_as_tagger

  private

  def generate_default_collection
    collection = Collection.new
    collection.name = "default"
    collection.description = "default desc"
    collection.tags = "default"
    collection.categories = "default"
    collection.parent_type = User
    collection.parent_id = self.id
    collection.save
  end

  def avatar_size_validation
    errors[:avatar] << "should be less than 2MB" if avatar.size > 10.megabytes
  end

end
