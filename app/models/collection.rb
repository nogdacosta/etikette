class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection
  has_many :bookmark
end
