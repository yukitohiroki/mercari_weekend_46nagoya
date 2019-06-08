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
