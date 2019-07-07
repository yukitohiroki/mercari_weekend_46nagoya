class BrandsController < ApplicationController

  before_action :set_brand, only: [:show]

  def index
  end

  def show
    @items = Item.includes(:item_images).page(params[:page]).per(80).order("created_at DESC")
    @item_images =ItemImage.all
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end
end

