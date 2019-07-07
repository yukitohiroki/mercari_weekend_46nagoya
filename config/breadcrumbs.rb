crumb :root do
  link "メルカリ", root_path
end

crumb :item_show do |item|
  link item.name
  parent :root
end

crumb :item_search_firstcategory do |second|
  first = FirstCategory.find(params[:id])
  link first.first_category
  parent :item_search_category
end

crumb :item_search_secondcategory do |second|
  second = SecondCategory.find(params[:id])
  link second.second_category
  parent :item_search_category
end

crumb :item_search_thirdcategory do |third|
  third = ThirdCategory.find(params[:id])
  link third.third_category
  parent :item_search_category
end

crumb :item_search_brand do |brand|
  brand = Brand.find(params[:id])
  link brand.brand
  parent :item_search_category
end

crumb :item_search do
  link '商品検索', search_path
  parent :root
end

crumb :item_search_category do
  link 'カテゴリー検索・ブランド検索', categorys_path
  parent :root
end

#以下マイページ関連
crumb :mypage do
  link "マイページ", user_path(current_user.id)
  parent :root
end

crumb :user_info do
  link "本人情報の登録", root_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_path
  parent :mypage
end

crumb :pay_info do
  link "支払い方法", root_path
  parent :mypage
end

crumb :card_info do
  link "クレジットカード情報入力", root_path
  parent :pay_info
end

crumb :profile do
  link "プロフィール", root_path
  parent :mypage
end

crumb :exhibit_items do
  link "出品した商品-出品中", user_exhibitation_products_path(current_user.id)
  parent :mypage
end

crumb :exhibit_item do
  link "出品商品画面", root_path
  parent :exhibit_items
end