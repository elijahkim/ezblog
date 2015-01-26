require "rails_helper"

RSpec.feature "An owner can update tags" do
  scenario "A owner updates a post's tag" do
    user = create(:user)
    posting = create(:post, user: user)
    tag_one = create(:tag)
    posting.tags << tag_one
    sign_in(user)

    visit post_path(posting)
    click_link "Edit Tag"
    fill_in "Tag", with: "Name"
    click_button "Update Tag"

    expect(page).to have_content "Name"
  end
end
