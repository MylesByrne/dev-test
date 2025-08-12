require 'rails_helper'

RSpec.describe "CarModels", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/car_models/index"
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET /new" do
    it "returns http success" do
      get "/car_models/new"
      expect(response).to have_http_status(:success)
    end
  end

end
