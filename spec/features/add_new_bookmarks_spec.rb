require 'rails_helper'

RSpec.feature "AddNewBookmarks", type: :feature do

  it "should require the user log in before adding a bookmark" do
    password = "123456789"
    u = create( :user, password: password, password_confirmation: password )

    visit new_bookmark_path

    within "#new_user" do
      fill_in "user_email", with: u.email
      fill_in "user_password", with: password
    end

    click_button "Log in"

    within "#new_bookmark" do
      fill_in "bookmark_title", with: "Bookmark title"
      fill_in "bookmark_url", with: "Bookmark url"
      fill_in "bookmark_tags", with: "Bookmark tags, something more"
    end

    click_link_or_button "Create Bookmark"

    expect( Bookmark.count ).to eq(1)
    expect( Bookmark.first.name).to eq( "bookmark title")
  end



end
