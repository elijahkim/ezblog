require "rails_helper"

RSpec.feature "An owner can delete tags" do
  scenario "A owner deletes a post's tag" do
    user = create(:user)
    posting = create(:post, user: user)
    tag_one = create(:tag)
    posting.tags << tag_one
    sign_in(user)

    visit post_path(posting)
    click_link "Delete Tag"

    expect(page).not_to have_content tag_one.name
  end
end
