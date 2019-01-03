require 'rails_helper'

RSpec.describe Item, type: :model do
  
  describe "should not valid without List" do
    it {should_not be_valid}
  end
  describe "should be valid object" do
    subject {(build_stubbed(:item))}
    it {is_expected.to be_valid}
  end
  
  describe "ActiveRecord Association" do
    let(:item) {create(:item)}
    it {expect(item).to belong_to(:list)}
  end
end
