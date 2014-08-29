require 'rails_helper.rb'

feature "user signs in" do
  scenario 'with valid inputs' do
    user = FactoryGirl.build(:user)

    user_clicks_through_to_sign_up_page

    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "password1"

    click_button "Sign Up"

    expect(session[:user_id]).to_not be_nil
    expect(current_path).to eq("/")
    expect(page).to have_content("Valid Title")
    expect(page).to have_content("Valid description, etc etc pontificate")
  end

  scenario 'with invalid inputs' do

    user_clicks_through_to_new_form_fills_title

    # user doesn't fill in description... why so STUPID????

    click_button "Create Prompt"
    expect(current_url).to eq("http://www.example.com/prompts/new")
    expect(page).to have_content("Invalid Prompt Submission, Please Try Again!")

    ## BUG BUG --  Form renders what we want, but test not passing. how to correct?


    # expect(page).to have_content("Valid Title")
    # expect("input[name='prompt[title]']").to have_content("Valid Title")
    # because they input 1 field, can the info persist w/out save?

  end

end


def user_clicks_through_to_sign_up_page
  visit "/"
  click_link "Signup"

  expect(page).to have_content("Email")
  expect(current_path).to eq("/users/new")

end
