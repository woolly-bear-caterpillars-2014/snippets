require 'rails_helper'

describe SnippetsController do
  let!(:snippet) {Snippet.new}
  let!(:user) {User.create(email: "awesomedude@email.com", password: "password")}
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

  describe 'Post #create' do
    context "when valid params are set" do
      let(:snippet_params) do
        { snippet: {
          title: "snippert",
          code: "codey",
          language: "ruby"
          }}
      end

      it "creates a snippet" do
        session[:user_id] = user.id
        expect {
          post :create, snippet_params }.to change(Snippet, :count).by(1)
          expect(response).to redirect_to("/snippets")
      end
    end

    context "when invalid params are set" do
    end
  end
end
