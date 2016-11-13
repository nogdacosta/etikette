class User < ApplicationRecord
  after_create :generate_default_collection

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :collection, as: :parent, dependent: :destroy

  has_many :sharings, as: :receiver, dependent: :destroy
  has_many :shared_collections, through: :sharings, source: :shareable, source_type: 'Collection', dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  # validates_presence_of   :avatar, on: :update
  # validates_integrity_of  :avatar, on: :update
  # validates_processing_of :avatar, on: :update

  validate :avatar_size_validation, on: :update

  acts_as_tagger

  def is_active?
    self.invitation_accepted? or self.confirmed?
  end

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
