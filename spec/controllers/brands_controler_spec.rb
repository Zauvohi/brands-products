require 'rails_helper'

RSpec.describe BrandsController, type: :controller do
  let(:valid_attributes) {
    { name: 'Brand1' }
  }

  let(:invalid_attributes) {
    { name: '' }
  }

  let(:brand) { Brand.create! valid_attributes }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all the brands" do
      b1 = Brand.create!(name: 'Brand2')
      b2 = Brand.create!(name: 'Brand3')
      get :index
      expect(assigns(:brands)).to match_array([b1, b2])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: brand.to_param }
      expect(response).to be_success
    end

    it "renders the show template" do
      get :show, params: { id: brand.to_param }
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
      get :edit, params: { id: brand.to_param }
      expect(response).to be_success
    end

    it "renders the edit template" do
      get :edit, params: { id: brand.to_param }
      expect(response).to render_template('edit')
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Brand" do
        expect {
          post :create, params: { brand: valid_attributes }
        }.to change(Brand, :count).by(1)
      end

      it "redirects to the created brand" do
        post :create, params: { brand: valid_attributes }
        expect(response).to redirect_to(Brand.last)
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        post :create, params: { brand: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'Brand2' }
      }

      it "updates the requested brand" do
        put :update, params: { id: brand.to_param, brand: new_attributes }
        brand.reload
        expect(brand.name).to eq(new_attributes[:name])
      end

      it "redirects to the brand" do
        put :update, params: { id: brand.to_param, brand: valid_attributes }
        expect(response).to redirect_to(brand)
      end
    end

    context "with invalid params" do
      it "returns a success " do
        put :update, params: { id: brand.to_param, brand: invalid_attributes }
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested brand" do
      brand = Brand.create! valid_attributes
      expect {
        delete :destroy, params: { id: brand.to_param }
      }.to change(Brand, :count).by(-1)
    end

    it "redirects to the brands list" do
      brand = Brand.create! valid_attributes
      delete :destroy, params: { id: brand.to_param }
      expect(response).to redirect_to(brands_url)
    end
  end

end
