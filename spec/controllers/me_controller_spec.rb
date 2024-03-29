require 'rails_helper'

RSpec.describe MeController, :type => :controller do

  describe "GET get" do
    it "returns http success" do
      get :get
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

end
