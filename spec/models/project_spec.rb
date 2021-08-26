require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { should belong_to :user }
    it { should have_many :ratings }
    it { should have_many :favorites }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
  end
end
