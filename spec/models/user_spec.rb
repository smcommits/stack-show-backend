require 'rails_helper'

RSpec.describe User, type: :model do 
  describe 'associations' do 
    it { should have_many(:projects) }
    it { should have_many(:ratings) }
    it { should have_many(:favorites) }
    it { should have_many(:favorite_projects) }
    it { should have_many(:messages) }
    it { should have_many(:user_conversations) }
    it { should have_many(:conversations) }
  end
end
