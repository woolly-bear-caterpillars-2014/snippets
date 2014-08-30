require 'rails_helper.rb'

feature "user signs up" do
  scenario 'with valid inputs' do
    user = FactoryGirl.build(:user)

    user_clicks_through_to_sign_up_page

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign Up"

    expect(User.last.email).to eq(user.email)
    # Assuming that we redirect to user profile after signup. Change
    # the following test if that's not the case.
    expect(find_link("Home")).to be_truthy
    expect(find_link("Log Out")).to be_truthy
  end

  scenario 'with invalid inputs' do

    user_clicks_through_to_sign_up_page

    fill_in "Email", with: "fake email!"
    fill_in "Password", with: "123"

    click_button "Sign Up"
    expect(current_path).to eq("/users/new")
    # expect(page).to have_content("Error")
  end
end


def user_clicks_through_to_sign_up_page
  visit "/"
  click_link "Sign Up"

  expect(page).to have_content("Email")
  expect(current_path).to eq("/users/new")
end
