require 'rails_helper'

describe User do

  context "invalid user" do
    let!(:user) { User.new }

    describe "#email" do
      it "should always have an email" do
        expect(user.save).to be_falsey
      end
    end

    describe "#password" do
      it "should always have a password" do
        expect(user.save).to be_falsey
      end
    end
  end

  context "associations" do
    let!(:user) { User.new(email: "test@sbctesting.com", password: "testing123") }

    describe "#cheatsheets" do
      it "should have many and respond to cheatsheets" do
        expect(user).to respond_to(:cheatsheets)
      end
    end

    describe "#snippets" do
      it "should have many and respond to snippets" do
        expect(user).to respond_to(:snippets)
      end
    end
  end
end
