module Sluggable
  extend ActiveSupport::Concern
  
  ##to add callback
  included do
    before_create :set_slug
  end
  
  def generate_slug
    random_string = SecureRandom.hex(6)
    "#{self.name.parameterize}-#{random_string}"
  end
  
  ##to_param method is inbuilt method, which always return ID of a record
  ## here we are overriding it -> sending slug instead of ID
  def to_param
    slug
  end
  
  private
  def set_slug
    self.slug = generate_slug
  end
  
end