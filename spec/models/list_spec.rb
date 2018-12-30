require 'rails_helper'

RSpec.describe List, type: :model do
  it 'has a valid factory' do
    build(:list).should be_valid
  end
end
