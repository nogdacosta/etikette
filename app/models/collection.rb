class Collection < ApplicationRecord
  belongs_to :parent, polymorphic: true
  has_many :collections, as: :parent, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  acts_as_taggable
  acts_as_taggable_on :meta

  def is_root?
    parent.instance_of? User if parent
  end

end
