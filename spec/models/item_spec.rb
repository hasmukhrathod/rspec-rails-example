require 'rails_helper'

RSpec.describe Item, type: :model do
  
  describe "should not valid without List" do
    it {should_not be_valid}
    #it {is_expected.not_to be_valid}
  end
  describe "should be valid object" do
    subject {(build_stubbed(:item))}
    it {should be_valid}
    #it {is_expected.to be_valid}
  end
  
  describe "ActiveRecord Association" do
    let(:item) {create(:item)}
    it {expect(item).to belong_to(:list)}
  end
  
  describe "#filter_words" do
    subject {build(:item)}
    it "should filter the cuss words" do
      expect(subject.filter_words).not_to include('Fuck','Shit')
      #puts subject.body
    end
  end
  
end
