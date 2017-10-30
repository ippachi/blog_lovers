require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    let(:user) { build(:user) }
    before { user.save }
    it "returns http success" do
      get :show, params: { screen_name: user.screen_name }
      expect(response).to have_http_status(:success)
    end
  end

end
