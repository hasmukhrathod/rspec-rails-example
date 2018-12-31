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
end