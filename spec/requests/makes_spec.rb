require 'rails_helper'

RSpec.describe "Makes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/makes/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/makes/new"
      expect(response).to have_http_status(:success)
    end
  end


end
