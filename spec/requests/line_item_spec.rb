require 'rails_helper'

RSpec.describe "LineItems", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/line_item/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/line_item/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/line_item/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/line_item/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/line_item/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
