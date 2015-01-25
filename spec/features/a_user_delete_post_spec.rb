require "rails_helper"

RSpec.feature "A user deletes a post" do
  scenario "A user deletes own post" do
    user = create(:user)
    posting = create(:post, user: user)
    sign_in(user)

    visit post_path(posting)
    click_button "Delete Post"

    expect(page).to have_content "Post deleted successfully"
  end
end
