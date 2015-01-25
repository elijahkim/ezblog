require "rails_helper"

RSpec.feature "A user can tag a post" do
  scenario "A user tags a post successfully" do
    user = create(:user)
    posting = create(:post, user: user)
    sign_in(user)
    visit post_path(posting)

    fill_in "Tag", with: "Awesome"
    click_button "Create Tag"

    expect(page).to have_content "Awesome"
  end
end
