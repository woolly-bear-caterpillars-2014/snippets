require 'rails_helper'

describe SnippetsController do
  let!(:snippet) {Snippet.new}
  describe 'Get #new' do
    it "creates and assigns a new snippet" do
      get :new
      expect(assigns(:snippet).new_record?).to be_truthy
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
end
