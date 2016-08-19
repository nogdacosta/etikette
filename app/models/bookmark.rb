class Bookmark < ApplicationRecord
  belongs_to :collection

  acts_as_taggable
  acts_as_taggable_on :meta
end
