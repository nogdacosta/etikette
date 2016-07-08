class Collection < ApplicationRecord
  belongs_to :user
  has_many :collections
  has_many :bookmarks
end
