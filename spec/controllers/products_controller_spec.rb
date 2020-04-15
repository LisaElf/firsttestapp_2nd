require 'rails_helper'

describe ProductsController, type: :controller do
  let (:product){ FactoryBot.create(:product) }
  let (:user){ FactoryBot.create(:user, admin: true) }
  let (:user_2){ FactoryBot.create(:user, admin: false) }
#INDEX
  context 'GET #index' do
    it 'renders index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end
#SHOW
  context 'get #show for specific product id' do
    it 'renders specific #show for the belonging product'do
      get :show, params: {id: product.id}
      expect(response).to be_ok
    end
  end

#NEW
  context 'user 2 tries to access /products/new but is not an admin' do
    before do
      sign_in user_2
    end
    it "will be redirected to root_url" do
      get :new
      expect(response).to redirect_to(root_url)
      expect(response).to have_http_status(:found)
    end
  end

  context 'user tries to access /products/new and is an admin' do
    before do
      sign_in user
    end
    it "/products/new will be rendered" do
      get :new
      expect(response).to be_ok
      expect(response).to render_template('new')
    end
  end
#EDIT
  context 'user 2 tries to access /edit but is not an admin' do
    before do
      sign_in user_2
    end
    it "will be redirected to root_url" do
      get :edit, params: {id: product.id}
      expect(response).to redirect_to(root_url)
      expect(response).to have_http_status(:found)
    end
  end

  context 'user tries to access edit and is an admin' do
    before do
      sign_in user
    end
    it "/edit will be rendered" do
      get :edit, params: {id: product.id}
      expect(response).to be_ok
      expect(response).to render_template('edit')
    end
  end

#CREATE
  context 'new product is created and has all necessary information' do
    it "returns a valid product" do
      expect(Product.new(name: "Bike", description: "New and fast bike", image_url: "www.test.com", colour: "black", price: "100")).to be_valid
    end
  end

  context 'new product is created but is missing a description' do
    it "returns an invalid product" do
      expect(Product.new(name: "Bike", description: nil, image_url: "www.test.com", colour: "black", price: "100")).not_to be_valid
    end
  end

#UPDATE
  context 'with good data by admin' do
    product = FactoryBot.create(:product, name: "Bike1", price: 200)

    before do
      sign_in user
    end

    let(:attr) do
      { :name => 'new name', :price => 100}
    end


    before(:each) do
      put :update, params: {id: product.id, :product => attr}
      product.reload
    end

    it "updates the product" do
      expect(response).to redirect_to(products_url)
      expect(product.name).to eql attr[:name]
      expect(product.price).to eql attr[:price]
    end
  end

  context 'update was not possible' do
    product = FactoryBot.create(:product, name: "Bike1", price: 200)

    before do
      sign_in user
    end

    let(:attr) do
      { :name => 'new name', :price => "t"}
    end


    before(:each) do
      put :update, params: {id: product.id, :product => attr}
      product.reload
    end

    it "should render '/edit' and show an error" do
      expect(product.price).not_to eql attr[:price]
    end
  end

#DESTROY
  context 'destroy product by admin' do
    product = FactoryBot.create(:product)
    before do
      sign_in user
    end
    it "should delete product" do
      expect do
        delete :destroy, params: { id: product.id }
      end.to change(Product, :count).by(-1)
    end
  end

end
