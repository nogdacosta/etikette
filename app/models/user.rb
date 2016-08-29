class User < ApplicationRecord
  after_create :generate_default_collection

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :collection, as: :parent

  has_many :sharings, as: :receiver
  has_many :shared_collections, through: :sharings, source: :shareable, :source_type => 'Collection'

  mount_uploader :avatar, AvatarUploader

  validates_presence_of   :avatar, on: :update
  validates_integrity_of  :avatar, on: :update
  validates_processing_of :avatar, on: :update

  validate :avatar_size_validation, on: :update

  acts_as_tagger

  private

  def generate_default_collection
    collection = Collection.new
    collection.name = "default"
    collection.parent_type = User
    collection.parent_id = self.id
    collection.save
  end

  def avatar_size_validation
    errors[:avatar] << "should be less than 2MB" if avatar.size > 10.megabytes
  end

end
