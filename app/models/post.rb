class Post < ApplicationRecord
  include Sluggable
  has_many :comments
  belongs_to :user
  enum status: [:draft, :published]
  
  validates :title, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :body, presence: true
  
  def self.posts_by_email(email)
    where(email: email)
  end
  
  def truncated_post
    body.slice(0,25)
  end
  
end
