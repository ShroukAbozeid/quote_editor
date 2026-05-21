require 'rails_helper'

RSpec.describe "Quotes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/quotes"
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get "/quotes"
      expect(response).to render_template(:index)
    end

    it "assigns @quotes" do
      quote = create(:quote)
      get "/quotes"
      expect(assigns(:quotes)).to eq([quote])
    end
  end
end
