require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "ActiveRecord Association" do
    let(:comment) {create(:comment)}
    it "should belong to post" do
      expect(comment).to belong_to(:post)
    end
  end
end
