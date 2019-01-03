class List < ApplicationRecord
  include Slugg
  has_many :items
  validates :name, :slug, presence: true, uniqueness: true
end
