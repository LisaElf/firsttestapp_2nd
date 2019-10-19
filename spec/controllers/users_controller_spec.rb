require 'rails_helper'

describe UsersController, type: :controller do
  let (:user) {User.create!(first_name: "Rosa", last_name: "Luxemburg", email: "rosa9.lux@example.com", password: "test123")}
  let (:user_2) {User.create!(first_name: "Simone", last_name: "de Beauvoir", email: "simonedebeauvoir@example.com", password: "1234567890")}
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
      it "redirects to root_url" do
        get :show, params: {id: user_2.id}
        expect(response).to redirect_to(root_url)
        expect(response).to have_http_status(:found)
      end
    end
  end
end
