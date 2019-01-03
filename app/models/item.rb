class Item < ApplicationRecord
  include Filter
  belongs_to :list
  #before_create :filter_words
end
