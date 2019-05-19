require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe 'GET #index' do

    it "正しいビューに変遷する" do
      get :index
      expect(response).to render_template :index
    end

    it "@ladies_itemsが期待される配列を持つ" do
      ladies_items =FactoryBot.create_list(:ladies_item, 4)
      get :index
      expect(assigns(:ladies_items)).to match(ladies_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@mens_itemsが期待される配列を持つ" do
      mens_items =FactoryBot.create_list(:mens_item, 4)
      get :index
      expect(assigns(:mens_items)).to match(mens_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@baby_itemsが期待される配列を持つ" do
      baby_items =FactoryBot.create_list(:baby_item, 4)
      get :index
      expect(assigns(:baby_items)).to match(baby_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@interior_itemsが期待される配列を持つ" do
      interior_items =FactoryBot.create_list(:interior_item, 4)
      get :index
      expect(assigns(:interior_items)).to match(interior_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@nike_itemsが期待される配列を持つ" do
      nike_items =FactoryBot.create_list(:nike_item, 4)
      get :index
      expect(assigns(:nike_items)).to match(nike_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@adidas_itemsが期待される配列を持つ" do
      adidas_items =FactoryBot.create_list(:adidas_item, 4)
      get :index
      expect(assigns(:adidas_items)).to match(adidas_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@puma_itemsが期待される配列を持つ" do
      puma_items =FactoryBot.create_list(:puma_item, 4)
      get :index
      expect(assigns(:puma_items)).to match(puma_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@reebok_itemsが期待される配列を持つ" do
      reebok_items =FactoryBot.create_list(:reebok_item, 4)
      get :index
      expect(assigns(:reebok_items)).to match(reebok_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@converse_itemsが期待される配列を持つ" do
      converse_items =FactoryBot.create_list(:converse_item, 4)
      get :index
      expect(assigns(:converse_items)).to match(converse_items.sort{ |a, b| b.created_at <=> a.created_at } )
    end
  end
end
