class Sharing < ApplicationRecord
  belongs_to :shareable, polymorphic: true
  belongs_to :receiver, polymorphic: true
end
