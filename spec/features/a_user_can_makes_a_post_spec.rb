require "rails_helper"

RSpec.feature "A user creates a post" do
  scenario "successfully" do
    user = create(:user)
    sign_in(user)
    visit dashboard_path

    click_link "New Post"
    fill_in "Title", with: "New post!"
    fill_in "Content", with: "This is some text"
    click_button "Create Post"

    expect(page).to have_content "New post"
  end

  scenario "user fails to provide a title" do
    user = create(:user)
    sign_in(user)
    visit dashboard_path

    click_link "New Post"
    fill_in "Content", with: "This is some text"
    click_button "Create Post"

    expect(page).to have_content "Title can't be blank"
  end

  scenario "user fails to provide content" do
    user = create(:user)
    sign_in(user)
    visit dashboard_path

    click_link "New Post"
    fill_in "Title", with: "New Post"
    click_button "Create Post"

    expect(page).to have_content "Content can't be blank"
  end
end
