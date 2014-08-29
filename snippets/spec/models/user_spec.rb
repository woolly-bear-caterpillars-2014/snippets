require 'rails_helper'

describe User do
  let!(:user) { User.new(email: "test@sbctesting.com", password: "testing123") }

  it "should have many and respond to cheatsheets" do
    expect(:user).to respond_to()
  end
end

