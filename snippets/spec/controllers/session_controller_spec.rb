require 'rails_helper'

describe SessionController do

  describe "valid user log-in" do
    let!(:user){User.create(email: "awesomedude@email.com", password: "password")}
    it "redirects to the root" do
      post :create, email: "awesomedude@email.com", password: "password"

      expect(response).to redirect_to snippets_path
    end

    it "session is set" do
      post :create, email: "awesomedude@email.com", password: "password"
      expect(session[:user_id]).to be
    end
  end

  describe "invalid user log-in" do
    it "redirects to the user login" do
     post :create, email: "notvalid_email@email.com"

     expect(response).to redirect_to 'new'
    end

    it "session is not set" do
      post :create, email: "notvalid_email@email.com"

      expect(session[:user_id]).not_to be
    end
  end
end
