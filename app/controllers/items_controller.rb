class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :order_confirm, :order_status]
  before_action :set_Category, only: [:new, :create, :edit, :update, :search]

  def index
    @items = Item.includes(:item_images).limit(4).order("created_at DESC")
  end

  def show
    @item_images = @item.item_images.where(item_id: @item.id)
    @user = current_user
    @message = Communication.new
    @like = Like.new
  end

  def new
    @item = current_user.items.new
    @item_images = 4.times{@item.item_images.build}
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, item_images: @item.item_images.build
    end
  end

  def edit
    (4 - @item.item_images.size).times{@item.item_images.new}
  end

  def update
    if @item.user_id == current_user.id
      if @item.update(item_params)
        redirect_to user_item_show_path(@item)
      else
        (4 - @item.item_images.size).times{@item.item_images.new}
        render :edit
      end
    end
  end


  def destroy
    if @item.user_id == current_user.id
      @item.destroy
    end
    redirect_to user_exhibitation_products_path(current_user.id)
  end

  def secondcategory
    @secondcategory = SecondCategory.where(first_category_id: params[:item][:first_category_id])
  end

  def thirdcategory
    @thirdcategory = ThirdCategory.where(second_category_id: params[:item][:second_category_id])
  end

  def search_secondcategory
    @secondcategory = SecondCategory.where(first_category_id: params[:q][:first_category_id_eq])
  end

  def search_thirdcategory
    @thirdcategory = ThirdCategory.where(second_category_id: params[:q][:second_category_id_eq])
  end

    Payjp::api_key ='sk_test_01fd21565272036e9153cfa6'

  def self.create_token(number, cvc, exp_year, exp_month)
  token = Payjp::Token.create(
      card: {
        number:    number,
        cvc:       cvc,
        exp_year:  exp_year,
        exp_month: exp_month,
      }
    )
    return token.id
  end

  def pay
    Payjp.api_key = 'sk_test_01fd21565272036e9153cfa6'
    @user = current_user
    @item = Item.find(params[:id])
    @item.update_attribute(:order_status_id, 2 )

    if customer_id = @user.customer_id
      customer = Payjp::Customer.retrieve(id: customer_id)
      charge = Payjp::Charge.create(
        amount: params['price'],
        customer: customer,
        currency: 'jpy',
      )
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @user.customer_id = customer.id
      @user.save

      charge = Payjp::Charge.create(
        amount: params['price'],
        customer: customer,
        currency: 'jpy',
      )
    end
    redirect_to root_path
  end

  def order_confirm
    @item_images = @item.item_images
  end

  def search
  end

  def order_status

    # 出品停止と出品中の切り替え
    if @item.order_status.id == 1
      @item.update(order_status_id: 3)
    else
      @item.update(order_status_id: 1)
    end

    redirect_back(fallback_location: root_path)
  end


  private

  def item_params
    params.require(:item).permit(
      :name, :price, :description, :first_category_id,
      :second_category_id, :third_category_id, :brand_id,
      :size_id, :condition_id, :delivery_charge_id, :prefecture_id,
      :delivery_date_id, :order_status_id, :delivery_way_id, item_images_attributes:[:id, :image, :_destroy])
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def set_Category
    @first = FirstCategory.all
    @second = SecondCategory.all
  end
end