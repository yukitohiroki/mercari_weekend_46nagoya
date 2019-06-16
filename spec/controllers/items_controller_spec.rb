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
      binding.pry
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

  describe 'POST#pay' do
    before do
      allow(Payjp::Charge).to receive(:create).and_return(PayjpMock.prepare_valid_charge)
    end

    it 'stubbing charge creation' do

      payjp_stub(:charges, :create, params: { amount: 3500, customer: 'cus_fe1beb3e434431c4c51c4b8137a4', currency: 'jpy' })

      Payjp::Charge.create(amount: 3500, customer: 'cus_fe1beb3e434431c4c51c4b8137a4', currency: 'jpy')
    end
  end
end
