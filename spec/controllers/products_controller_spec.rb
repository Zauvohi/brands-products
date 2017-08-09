require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  before do
    brand = Brand.new(name: 'Test-Brand')
    brand.save
  end

  let(:valid_attributes) {
    { name: 'Product1', brand_id: 1, description: 'Test', price: 10 }
  }

  let(:invalid_attributes) {
    { name: '', brand_id: nil, description: 'Test', price: nil }
  }

  let(:product) { Product.create! valid_attributes }


  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all the products" do
      p1 = Product.create! valid_attributes
      p2 = Product.create! valid_attributes
      get :index
      expect(assigns(:products)).to match_array([p1, p2])
    end
  end

  describe "GET #show" do


    it "returns a success response" do
      #product = Product.create! valid_attributes
      get :show, params: { id: product.to_param }
      expect(response).to be_success
    end

    it "renders the show template" do
      get :show, params: { id: product.to_param }
      expect(response).to render_template('show')
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_success
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      #product = Product.create! valid_attributes
      get :edit, params: { id: product.to_param }
      expect(response).to be_success
    end

    it "renders the edit template" do
      get :edit, params: { id: product.to_param }
      expect(response).to render_template('edit')
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: { product: valid_attributes }
        }.to change(Product, :count).by(1)
      end

      it "redirects to the created product" do
        post :create, params: { product: valid_attributes }
        expect(response).to redirect_to(Product.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { product: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { price: 15 }
      }

      it "updates the requested product" do
        product = Product.create! valid_attributes
        put :update, params: { id: product.to_param, product: new_attributes }
        product.reload
        expect(product.price).to eq(new_attributes[:price])
      end

      it "redirects to the product" do
        product = Product.create! valid_attributes
        put :update, params: { id: product.to_param, product: valid_attributes }
        expect(response).to redirect_to(product)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        product = Product.create! valid_attributes
        put :update, params: { id: product.to_param, product: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      product = Product.create! valid_attributes
      expect {
        delete :destroy, params: { id: product.to_param }
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = Product.create! valid_attributes
      delete :destroy, params: { id: product.to_param }
      expect(response).to redirect_to(products_url)
    end
  end

end
