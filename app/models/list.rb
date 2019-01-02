class List < ApplicationRecord
  include Sluggable
  
  has_many :items
  validates :name, :slug, presence: true, uniqueness: true
end
