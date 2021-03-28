require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "route#index" do
    it "status 200" do
      users = User.all
      get users_path
      expect(response).to be_successful
      expect(assigns(:users)).to eq(users)
    end
  end
end
