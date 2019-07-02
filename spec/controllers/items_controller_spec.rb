require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe 'GET #index' do

    before do
      get :index
    end

    it "正しいビューに変遷する" do
      expect(response).to render_template :index
    end

    it "@itemsが期待される配列を持つ" do
      items =FactoryBot.create_list(:item, 4)
      expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }	

    before do
      @item = create(:item)	
      get :show, params: {id: @item}	
    end	

    it "正しいビューに変遷する" do	
      expect(response).to render_template :show	
    end	

    it "@itemが期待される値を持つ" do	
      expect(assigns(:item)).to eq @item	
    end	

    it "@item_imagesが期待される配列を持つ" do 
      items =FactoryBot.create_list(:item_image, 200)
      expect(assigns(:item_images)).to match(@item.item_images.where(item_id: @item.id))
    end	

    it "@userが期待される値を持つ" do
      login(user)
      expect(assigns(:user)).to eq @user
    end	
  end

  describe 'GET #new' do
    let(:user) { create(:user)}

    before do
      @item = create(:item)	
      login(user)
      get :new, params: {id: @item}	
    end

    it "item_imageを生成する" do
      item_images = []
      items = FactoryBot.create_list(:item, 4)
      items.each do |item|
        item_images.push(item.item_images)
      end
      get :index
      expect(assigns(:item_images)).to match(item_images.count)
    end

    context 'login' do
      it "正しいビューに変遷する" do
        expect(response).to render_template :new
      end
    end

    context 'not login' do
      it '正しいビューに変遷する' do
        redirect_to new_user_session_path
      end
    end
  end
    describe 'GET#show' do
    let(:item) { create(:item)}
    before {get :show, params: {id: item.id}, session: {} }

    it "returns a 200 response" do
      expect(response).to have_http_status "200"
    end

    it "assigns @item" do
      expect(assigns(:item)).to eq item
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    let(:item) { create(:item) }
    before { get :edit, params: { id: item.id }, session: {} }

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @item' do
      expect(assigns(:item)).to eq item
    end

    it 'renders the :edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    let!(:item) { create(:item) }
    let(:update_attributes) do
      {
        name: 'update name',
        price: 'update price',
        description: 'update description'
      }
  end

    it 'saves updated item' do
      expect do
        patch :update, params: { id: item.id, item: update_attributes }, session: {}
      end.to change(Item, :count).by(0)
    end

    it 'updates updated item' do
      patch :update, params: { id: item.id, item: update_attributes }, session: {}
      item.reload
      expect(item.name).to eq update_attributes[:name]
      expect(item.price).to eq update_attributes[:price]
      expect(item.description).to eq update_attributes[:description]
    end

    it 'redirects the :create template' do
      patch :update, params: { id: item.id, item: update_attributes }, session: {}
      item = Item.last
      expect(response).to redirect_to(item_path(item))
    end
  end
  describe 'delete #destroy' do
    let(:user) { create(:user) }
    before do
      @item = create(:item, user_id: user.id)
    end

    context 'log in' do
      before do
        sign_in user
        @item.user_id == user.id
      end
      it 'リクエストは302 リダイレクトとなること' do
        delete :destroy, id: @item.id
        expect(response.status).to eq 302
      end

      it 'データベースから要求されたアイテムが削除されること' do
        expect do
          delete :destroy, params: { id: @item.id }, session: {}
        end.to change(Item,:count).by(-1)
      end

      it '削除後に指定したページにリダイレクトすること' do
        delete :destroy, params: { id: @item.id }, session: {}
        expect(response).to redirect_to("http://test.host/users/user_exhibitation_products/#{user.id}")
      end
    end
  end

  describe 'POST#pay' do
    before do
      allow(Payjp::Charge).to receive(:create).and_return(PayjpMock.prepare_valid_charge)
    end

    it 'stubbing charge creation' do

      payjp_stub(:charges, :create, params: { amount: 3500, customer: 'cus_fe1beb3e434431c4c51c4b8137a4', currency: 'jpy' })

      Payjp::Charge.create(amount: 3500, customer: 'cus_fe1beb3e434431c4c51c4b8137a4', currency: 'jpy')
    end
  end
  
  
  describe 'GET #search' do
    let(:user) { create(:user) }
    
    before do
      login(user)
      get :search
    end
    
    it "正しいビューを表示する" do
      expect(response).to render_template :search
    end
  end

  describe 'GET #search_secondcategory, #search_thirdcategory' do

    before do
      @second_item = FactoryBot.create(:ledies_item)
      @third_item = FactoryBot.create(:tops_item)
      get :search, params: {id: @item}
    end

    it "@secondcategoryが期待される配列を持つ" do
      ledies_category = FactoryBot.create(:ledies_category)
      expect(@second_item.first_category_id).to eq(ledies_category.first_category_id)
    end
    it "@thirdcategoryが期待される配列を持つ" do
      tops_category = FactoryBot.create(:tops_category)
      expect(@third_item.second_category_id).to eq(tops_category.second_category_id)
    end
  end
end