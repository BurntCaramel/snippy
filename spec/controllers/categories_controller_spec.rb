require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:valid_attributes) {
    {
      title: 'Example'
    }
  }

  let(:invalid_attributes) {
    {
      title: ''
    }
  }

  describe 'index' do
    it 'renders #index' do
      category = Category.create! valid_attributes
      get :index
      expect(assigns(:categories)).to eq([category])
      assert_template 'categories/index'
    end
  end

  describe 'show' do
    it 'renders #show' do
      category = Category.create! valid_attributes
      get :show, params: { id: category.to_param }
      expect(assigns(:category)).to eq(category)
      assert_template 'categories/show'
    end
  end

  describe 'new' do
    it 'renders #new' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
      assert_template 'categories/new'
    end
  end

  describe 'create' do
    context 'with valid params' do
      it 'saves and redirects to created' do
        expect {
          post :create, params: { category: valid_attributes }
        }.to change(Category, :count).by(1)
        expect(assigns(:category)).to be_a(Category)
        expect(assigns(:category)).to be_persisted
        expect(response).to redirect_to(Category.last)
      end
    end

    context 'with invalid params' do
      it 'renders new again' do
        post :create, params: { category: invalid_attributes }
        expect(assigns(:category)).to be_a_new(Category)
        expect(assigns(:category).errors).to_not be_empty
        assert_template 'categories/new'
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'edit' do
    it 'renders #edit' do
      category = Category.create! valid_attributes
      get :edit, params: { id: category.to_param }
      expect(assigns(:category)).to be_a(Category)
      assert_template 'categories/edit'
    end
  end

  describe 'update' do
    context 'with valid params' do
      let (:new_attributes) {
        {
          title: 'New!'
        }
      }

      it 'saves and redirects to created' do
        category = Category.create! valid_attributes
        expect {
          put :update, params: { id: category.to_param, category: new_attributes }
        }.to change(Category, :count).by(0)
        category.reload
        expect(assigns(:category)).to eq(category)
        expect(response).to redirect_to(category)
      end
    end

    context 'with invalid params' do
      it 'renders edit again' do
        category = Category.create! valid_attributes
        put :update, params: { id: category.to_param, category: invalid_attributes }
        expect(assigns(:category)).to eq(category)
        expect(assigns(:category).errors).to_not be_empty
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'destroy' do
    it 'destroys and redirect to index' do
      category = Category.create! valid_attributes
      expect {
        delete :destroy, params: { id: category.to_param }
      }.to change(Category, :count).by(-1)
      expect(response).to redirect_to(categories_url)
    end
  end
end
