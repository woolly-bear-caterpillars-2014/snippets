require 'rails_helper'

describe Cheatsheet do

  context "associations" do
    let!(:cheatsheet) { Cheatsheet.new(name: "Enumms", user: User.new) }

    describe "#user" do
      it "should belong to a user" do
        expect(cheatsheet).to respond_to(:user)
      end
    end
  end
end
