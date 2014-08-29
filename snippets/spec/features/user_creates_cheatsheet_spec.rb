require 'rails_helper'

describe "user creates cheatsheet" do
  # before :each do
  #   User.make(:email => 'user@example.com', :password => 'caplin')
  # end

  scenario "valid user makes cheatsheet without snippets" do
    visit '/users/new'

    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'useruser'

    click_button 'Sign Up'

    expect(current_url).to eq("http://www.example.com/users/#{User.last.id}")
    # expect(page).to have_content ''
    click_link("Create a New Cheatsheet")
    expect(current_url).to eq("http://www.example.com/users/#{User.last.id}/cheatsheets/new")

    fill_in  "Name Your Cheatsheet", :with => "Eddie's Sheet of Cheat"
    click_button 'Create Cheatsheet'

    expect(current_url).to eq("http://www.example.com/users/#{User.last.id}")

    expect(page).to have_content("Eddie's Sheet of Cheat")

  end


end
