require 'rails_helper'

RSpec.describe "Quotes", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  describe 'creating a quote' do
    it 'enables users to create a quote' do
      visit '/quotes'
      assert_selector "h1", text: "Quotes"

      click_on "New quote"
      fill_in "Content", with: "This is a test quote."
      assert_selector "h1", text: "Quotes"

      click_button "Create quote"
      assert_selector "h1", text: "Quotes"

      expect(page).to have_content("This is a test quote.")
    end
  end

  describe 'displaying a quote' do
    let!(:quote) { create(:quote) }

    it 'enables users to view a quote' do
      visit "/quotes"
      assert_selector "a", text: quote.content
      click_on quote.content
      assert_selector "h1", text: quote.content
    end
  end

  describe "updating a quote" do
    before { create(:quote, content: old_content) }

    let(:old_content) { Faker::Lorem }

    it "enables users to update a quote" do
      visit "/quotes"
      click_on "Edit", match: :first
      fill_in "Content", with: "This is an updated test quote."
      assert_selector "h1", text: "Quotes"

      click_button "Update quote"

      assert_selector "h1", text: "Quotes"
      expect(page).to have_content("This is an updated test quote.")
      expect(page).not_to have_content(old_content)
    end
  end
  describe 'Destroying a quote' do
     let!(:quote) { create(:quote) }

    it "enables Destroying a quote" do
      visit '/quotes'
      assert_text quote.content

      click_on "Delete", match: :first
      assert_no_text quote.content
    end
  end
end
