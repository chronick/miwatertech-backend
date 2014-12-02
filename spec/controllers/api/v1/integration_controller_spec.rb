require 'rails_helper'

RSpec.describe Api::V1::IntegrationController, :type => :controller do

  describe "GET readings" do
    it "returns http success" do
      get :readings
      expect(response).to have_http_status(:success)
    end
  end

end
