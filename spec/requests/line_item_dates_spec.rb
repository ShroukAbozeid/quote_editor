require 'rails_helper'

RSpec.describe "LineItemDates", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/line_item_dates/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/line_item_dates/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/line_item_dates/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/line_item_dates/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
