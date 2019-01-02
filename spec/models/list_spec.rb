require 'rails_helper'

RSpec.describe List, type: :model do
  describe 'Validations' do
    subject {build(:list)}
    it 'should be a valid object' do
      should be_valid 
    end
    
    ##it will check this validation in Model -> it has nothing to do with factory right now.
    it 'must have a name' do
      should validate_presence_of(:name)
    end
    it 'must have a unique name' do
      should validate_uniqueness_of(:name)
    end
  end
  
  describe "ActiveRecord Callbacks" do
    ##Reduce the number of objects persisted to the database. 
    
    ### `build` creates an Article object without saving
    # `build_stubbed` creates an Article object and acts as an already saved Article
    let(:list) {build_stubbed(:list)}
    subject {list.slug}
    
    it "should generate slug & save on create" do
      list.run_callbacks :create
      should_not be_empty
    end
    
  end
end