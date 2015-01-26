require "rails_helper"

RSpec.feature "A user updates email" do
  scenario "successfully" do
    user = create(:user)
    sign_in(user)
    visit edit_user_path(user)

    fill_in "Email", with: "test@test.com"
    click_button "Update Email"

    expect(page).to have_content "Email saved successfully"
  end
end
