require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:username).is_at_least(3).is_at_most(15) }
    it { should have_secure_password }
  end
  describe "Association" do
    it { should have_many(:messages) }
  end
end
