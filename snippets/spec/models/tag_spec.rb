require 'rails_helper'

describe Tag do

  context "validations" do
    describe "Tag instantiated without title" do
      let!(:tag) { Tag.new }

      it "should not exist" do
        expect(tag.save).to be_falsey
      end
    end

    describe "Tag instantiated without a unique title" do
      let!(:tag) { Tag.create(title: "Ennumerable") }
      let!(:tag2) { Tag.new(title: "Ennumerable") }

      it "should not exist" do
        expect(tag2.save).to be_falsey
      end
    end
  end

  context "associations" do
    let!(:tag) { Tag.new(title: "Enumms") }

    describe "#snippets" do
      it "should have many and respond to snippets" do
        expect(tag).to respond_to(:snippets)
      end
    end
  end
end
