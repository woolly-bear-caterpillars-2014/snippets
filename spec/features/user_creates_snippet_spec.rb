require 'rails_helper'

feature "create new snippet" do

  before :each do
    user = User.create(:email => 'user@example.com', :password => 'password')
  end

  scenario "allows me to create a snippet" do
    visit 'users/login'

    fill_in 'email', :with => 'user@example.com'
    fill_in 'password', :with => 'password'

    click_button 'Log In'

    expect(current_url).to eq("http://www.example.com/snippets")

    within("#new_snippet") do
      fill_in 'snippet[title]', :with => 'Coolest Code Ever'
      fill_in 'snippet[code]', :with => '3.times do { stuff }'
    end

    click_button 'Create Snippet'

    expect(current_url).to eq("http://www.example.com/snippets")
  end

end
