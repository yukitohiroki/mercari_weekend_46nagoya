class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_Category, only: [:new, :create, :edit, :update]

  def index
    @ladies_items   = Item.includes(:item_images).where(first_category_id:1).limit(4).order("created_at DESC")
    @mens_items     = Item.includes(:item_images).where(first_category_id:2).limit(4).order("created_at DESC")
    @baby_items     = Item.includes(:item_images).where(first_category_id:3).limit(4).order("created_at DESC")
    @interior_items = Item.includes(:item_images).where(first_category_id:4).limit(4).order("created_at DESC")

    @nike_items     = Item.includes(:item_images).where(brand_id:2).limit(4).order("created_at DESC")
    @adidas_items   = Item.includes(:item_images).where(brand_id:3).limit(4).order("created_at DESC")
    @puma_items     = Item.includes(:item_images).where(brand_id:4).limit(4).order("created_at DESC")
    @reebok_items   = Item.includes(:item_images).where(brand_id:5).limit(4).order("created_at DESC")
    @converse_items = Item.includes(:item_images).where(brand_id:6).limit(4).order("created_at DESC")
  end

  def show
    @item_images = @item.item_images
    @user = current_user
    @user_items     = Item.includes(:item_images).where(user_id: @item.user.id).limit(6).order("created_at DESC")
    @category_items = Item.includes(:item_images).where(third_category_id: @item.third_category.id).limit(6).order("created_at DESC")
    @message  = Message.new
    @messages = @item.messages.includes(:user)
  end

  def new
    @item = current_user.items.new
    4.times{@item.item_images.build}

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

    Payjp::api_key ='sk_test_c5be69e2d1ccf9815f894a2d'

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
    Payjp.api_key = 'sk_test_c5be69e2d1ccf9815f894a2d'
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
  def set_item
    @item = Item.find(params[:id])
  end
  def set_Category
    @first = FirstCategory.all
    @second = SecondCategory.all
  end

end

