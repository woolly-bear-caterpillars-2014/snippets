require 'rails_helper'

describe Snippet do

  context "validations" do
    let!(:snippet) { Snippet.new }

    describe "Snippet instantiated without language specified" do
      it "should not exist" do
        expect(snippet.save).to be_falsey
      end
    end
  end

  context "associations" do
    let!(:snippet) { Snippet.new(title: "Enumms", code: "def method", language: "ruby", author: User.new) }

    describe "#author" do
      it "should belong to an author" do
        expect(snippet).to respond_to(:authorsn)
      end
    end

    describe "#cheatsheets" do
      it "should have many and respond to cheatsheets" do
        expect(snippet).to respond_to(:cheatsheets)
      end
    end

    describe "#tags" do
      it "should have many and respond to tags" do
        expect(snippet).to respond_to(:tags)
      end
    end
  end
end
