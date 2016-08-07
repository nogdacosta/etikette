class Collection < ApplicationRecord
  belongs_to :parent, polymorphic: true
  has_many :collections, as: :parent
  has_many :bookmarks

  def is_root?
    parent.instance_of? User if parent
  end

end
