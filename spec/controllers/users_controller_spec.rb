require 'rails_helper'

describe UsersController do
  let(:user) { FactoryGirl.build(:user) }

  context "#show" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      get :show, :id => user.id
    end

    it "assigns the current user to a variable" do
      expect(assigns(:user)).to eq user
    end

    it "renders the user profile page" do
      expect(response).to render_template(:show)
    end
  end

  context "#new" do
    before do
      get :new
    end

    it "renders the user signup page" do
      expect(response).to render_template(:new)
    end

    it "assigns a new user to a variable" do
      expect(assigns(:user)).to be
    end
  end

  context "#create" do
    context "with valid input" do
      it "creates a new user when submitted with valid input" do
        expect{
          post :create, :user => { email: user.email, password: user.password }
        }.to change{User.all.count}.by(1)
      end

      it "redirects to user profile page" do
        post :create, :user => { email: user.email, password: user.password }
        expect(response).to redirect_to(user_path(assigns(:user).id))
      end
    end

    context "with invalid input" do
      it "does not create a new user" do
        expect{
          post :create, :user => { email: "", password: "" }
        }.not_to change{ User.all.count }
      end

      it "re-renders the users#new page" do
        post :create, :user => { email: "", password: "" }

        expect(response).to redirect_to new_user_path
      end
    end
  end

  context "#edit" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      session[:user_id] = user.id
      get :edit, :id => user.id
    end

    it "assigns the current user to a variable" do
      expect(assigns(:user)).to eq user
    end

    it "renders the user's edit page" do
      expect(response).to render_template(:edit)
    end

    context "when logged in as another user" do
      let(:user2) { FactoryGirl.create(:user) }

      it "should redirect to index page" do
        session[:user_id] = user2.id
        get :edit, :id => user.id
        response.should redirect_to(root_path)
      end
    end
  end

  context "#update" do
    let(:user) { FactoryGirl.create(:user) }
    context "when logged in as correct user" do
      context "with valid params" do
        before do
          session[:user_id] = user.id
          put :update, :id => user.id,
                       :user => {
                          email: "newEmail@test.com",
                          password: user.password
                        }
        end

        it "changes the users's email" do
          expect(User.find(user.id).email).to eq "newEmail@test.com"
        end

        it "redirects to the user profile page" do
          expect(response).to redirect_to(user_path)
        end
      end

      context "with invalid params" do
        before do
          session[:user_id] = user.id
          put :update, :id => user.id,
                       :user => {
                          email: "",
                          password: user.password
                        }
        end

        it "does not change the users's email" do
          expect(User.find(user.id).email).to eq user.email
        end

        it "re-renders the user edit page" do
          expect(response).to render_template(:edit)
        end
      end
    end

    context "when logged in as another user" do
      let(:user2) { FactoryGirl.create(:user) }
      before do
        session[:user_id] = user2.id
        put :update, :id => user.id,
                     :user => {
                        email: "",
                        password: user.password
                      }
      end

      it "should not edit user" do
        expect(User.find(user.id).email).to eq user.email
      end
    end
  end

  context "#destroy" do
    let(:user) { FactoryGirl.create(:user) }

    context "when logged in as correct user" do
      before do
        session[:user_id] = user.id
      end

      it "should delete user" do
        expect{
          delete :destroy, id: user.id
        }.to change{ User.all.count }.by(-1)
      end

      it "should redirect to login page" do
        delete :destroy, id: user.id
        response.should redirect_to(root_path)
      end
    end

    context "when logged in as another user" do
      let(:user2) { FactoryGirl.create(:user) }
      before do
        session[:user_id] = user2.id
        delete :destroy, id: user.id
      end

      it "should not delete user" do
        user2 { should_not exist }
      end

      it "should redirect to index page" do
        expect(response).to redirect_to("/")
      end
    end
  end
end
