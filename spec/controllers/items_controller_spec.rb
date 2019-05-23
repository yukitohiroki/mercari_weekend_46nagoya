require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe 'GET #index' do

    before do
      get :index
    end

    it "正しいビューに変遷する" do
      expect(response).to render_template :index
    end

    it "@ladies_itemsが期待される配列を持つ" do
      ladies_items =FactoryBot.create_list(:ladies_item, 4)
      expect(assigns(:ladies_items)).to match(ladies_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@mens_itemsが期待される配列を持つ" do
      mens_items =FactoryBot.create_list(:mens_item, 4)
      expect(assigns(:mens_items)).to match(mens_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@baby_itemsが期待される配列を持つ" do
      baby_items =FactoryBot.create_list(:baby_item, 4)
      expect(assigns(:baby_items)).to match(baby_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@interior_itemsが期待される配列を持つ" do
      interior_items =FactoryBot.create_list(:interior_item, 4)
      expect(assigns(:interior_items)).to match(interior_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@nike_itemsが期待される配列を持つ" do
      nike_items =FactoryBot.create_list(:nike_item, 4)
      expect(assigns(:nike_items)).to match(nike_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@adidas_itemsが期待される配列を持つ" do
      adidas_items =FactoryBot.create_list(:adidas_item, 4)
      expect(assigns(:adidas_items)).to match(adidas_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@puma_itemsが期待される配列を持つ" do
      puma_items =FactoryBot.create_list(:puma_item, 4)
      expect(assigns(:puma_items)).to match(puma_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@reebok_itemsが期待される配列を持つ" do
      reebok_items =FactoryBot.create_list(:reebok_item, 4)
      expect(assigns(:reebok_items)).to match(reebok_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@converse_itemsが期待される配列を持つ" do
      converse_items =FactoryBot.create_list(:converse_item, 4)
      expect(assigns(:converse_items)).to match(converse_items.sort{ |a, b| b.created_at <=> a.created_at } )
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
      expect(assigns(:item_images)).to match(@item.item_images)
    end

    it "@userが期待される値を持つ" do
      expect(assigns(:user)).to eq @user
    end
    
    it "@user_itemsが期待される配列を持つ" do
      user_items =FactoryBot.create_list(:user_item, 6, user_id: @item.user.id)
      expect(assigns(:user_items)).to match(user_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end
    
    it "@category_itemsが期待される配列を持つ" do
      category_items =FactoryBot.create_list(:category_item, 6, third_category: @item.third_category)
      expect(assigns(:category_items)).to match(category_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@messageが生成される" do
      message = create(:message)
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "@messagesが期待される配列を持つ" do
      message = create_list(:message, 5,  user_id: user.id)
      expect(assigns(:messages)).to match(@item.messages)
    end
  end
end
