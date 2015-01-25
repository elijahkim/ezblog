require "rails_helper"

RSpec.feature "A user edits a post" do
  scenario "A user tries to edit own post" do
    user = create(:user)
    posting = create(:post, user: user)
    sign_in(user)
    visit post_path(posting)

    click_link "Edit Post"
    fill_in "Title", with: "New Title"
    click_button "Update Post"

    expect(page).to have_content "New Title"
  end

  scenario "A user tried to edit other post" do
    user = create(:user)
    other_poster = create(:user)
    posting = create(:post, user: other_poster)
    sign_in(user)
    visit edit_post_path(posting)

    expect(page).to have_content "You are not authorized to access this page"
  end
end
