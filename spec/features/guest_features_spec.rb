require "rails_helper"

RSpec.feature "A guest lands on the landing page" do
  scenario "A guest creates a user" do
    visit root_path
    click_link "Sign up"

    fill_in "Email", with: "Bob@bob.com"
    fill_in "Password", with: "password"
    click_button "Sign up"

    expect(page).to have_content "Signed up successfully"
  end
end
