require 'rails_helper'

describe UsersController, type: :controller do
  let (:user){ FactoryBot.create(:user) }
  let (:user_2){ FactoryBot.create(:user, first_name: "Lisa" ) }
  describe 'GET #show' do
    context "when a user is logged in" do
      before do
        sign_in user
      end
      it "loads correct user details" do
        get :show, params: {id: user.id}
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
    end
    context "when a user is not logged in" do
      it "redirects to root_url" do
        get :show, params: {id: user.id}
        expect(response).to redirect_to(root_url)
      end
    end
    context "when user tries to acces user 2 details" do
      before do
        sign_in user
      end
      it "redirects to root_url" do
        get :show, params: {id: user_2.id}
        expect(response).to redirect_to(root_url)
        expect(response).to have_http_status(:found)
      end
    end
  end
end
