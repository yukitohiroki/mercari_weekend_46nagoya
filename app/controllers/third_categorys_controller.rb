class ThirdCategorysController < ApplicationController
  before_action :set_category, only: [:show]

  def show
    @items = Item.includes(:item_images).page(params[:page]).per(80).order("created_at DESC")
    @item_images =ItemImage.all
  end

  private

  def set_category
    @third_category = ThirdCategory.find(params[:id])
  end
end
