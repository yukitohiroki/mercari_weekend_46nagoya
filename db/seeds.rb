require "csv"

CSV.foreach('db/brands.csv', headers: true) do |row|
  Brand.create(
    brand: row['brand'],
    first_category_id: row['first_category_id'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

CSV.foreach('db/conditions.csv', headers: true) do |row|
  Condition.create(
    condition: row['condition'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

CSV.foreach('db/delivery_charges.csv', headers: true) do |row|
  DeliveryCharge.create(
    charge: row['charge'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

CSV.foreach('db/delivery_dates.csv', headers: true) do |row|
  DeliveryDate.create(
    date: row['date'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

CSV.foreach('db/delivery_ways.csv', headers: true) do |row|
  DeliveryWay.create(
    way: row['way'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

CSV.foreach('db/first_categories.csv', headers: true) do |row|
  FirstCategory.create(
    first_category: row['first_category'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

CSV.foreach('db/order_statuses.csv', headers: true) do |row|
  OrderStatus.create(
    order_status: row['order_status'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

CSV.foreach('db/point_statuses.csv', headers: true) do |row|
  PointStatus.create(
    point_status: row['point_status'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end


CSV.foreach('db/prefectures.csv', headers: true) do |row|
  Prefecture.create(
    prefecture: row['prefecture'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

CSV.foreach('db/second_categories.csv', headers: true) do |row|
  SecondCategory.create(
    first_category_id: row['first_category_id'],
    size_category_id: row['size_category_id'],
    second_category:   row['second_category'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

CSV.foreach('db/sizes.csv', headers: true) do |row|
  Size.create(
    size_category_id: row['size_category_id'],
    size:             row['size'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

CSV.foreach('db/third_categories.csv', headers: true) do |row|
  ThirdCategory.create(
    second_category_id: row['second_category_id'],
    third_category:     row['third_category'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end

CSV.foreach('db/users.csv', headers: true) do |row|
  user = User.new(
    nickname: row['nickname'],
    first_name: row['first_name'],
    first_name_kana: row['first_name_kana'],
    last_name: row['last_name'],
    last_name_kana:   row['last_name_kana'],
    city: row['city'],
    address: row['address'],
    building: row['building'],
    email:   row['email'],
    password: row['password'],
    reset_password_token: row['reset_password_token'],
    telephone: row['telephone'],
    zip_code:   row['zip_code'],
    birth_year: row['birth_year'],
    birth_month: row['birth_month'],
    birth_day: row['birth_day'],
    point_id:   row['point_id'],
    profit_amount: row['profit_amount'],
    user_icon: row['user_icon'],
    introduction: row['introduction'],
    remember_created_at:   row['remember_created_at'],
    reset_password_sent_at: row['reset_password_sent_at'],
    prefecture_id: row['prefecture_id'],
    created_at: row['created_at'],
    updated_at: row['updated_at'],
    customer_id: row['customer_id']
  )
  user.save!
end


