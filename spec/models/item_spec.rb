require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "ActiveRecord Association" do
    let(:item) {create(:item)}
    it {should belong_to(:list)}
  end
end
