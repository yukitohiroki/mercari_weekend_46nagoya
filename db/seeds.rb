require "csv"

CSV.foreach('db/brands.csv', headers: true) do |row|
  Brand.create(
    brand: row['brand']
  )
end

CSV.foreach('db/conditions.csv', headers: true) do |row|
  Condition.create(
    condition: row['condition']
  )
end

CSV.foreach('db/delivery_charges.csv', headers: true) do |row|
  DeliveryCharge.create(
    charge: row['charge']
  )
end

CSV.foreach('db/delivery_dates.csv', headers: true) do |row|
  DeliveryDate.create(
    date: row['date']
  )
end

CSV.foreach('db/delivery_ways.csv', headers: true) do |row|
  DeliveryWay.create(
    way: row['way']
  )
end

CSV.foreach('db/first_categories.csv', headers: true) do |row|
  FirstCategory.create(
    first_category: row['first_category']
  )
end

CSV.foreach('db/item_images.csv', headers: true) do |row|
  ItemImage.create(
    image:   row['image'],
    item_id: row['item_id']
  )
end

CSV.foreach('db/items.csv', headers: true) do |row|
  Item.create(
    user_id:             row['user_id'],
    name:                row['name'],
    price:               row['price'],
    description:         row['description'],
    first_category_id:   row['first_category_id'],
    second_category_id:  row['second_category_id'],
    third_category_id:   row['third_category_id'],
    brand_id:            row['brand_id'],
    size_id:             row['size_id'],
    condition_id:        row['condition_id'],
    delivery_charge_id:  row['delivery_charge_id'],
    prefecture_id:       row['prefecture_id'],
    delivery_date_id:    row['delivery_date_id'],
    order_status_id:     row['order_status_id'],
    created_at:          row['created_at'],
    updated_at:          row['updated_at'],
    delivery_way_id:     row['delivery_way_id']
  )
end

CSV.foreach('db/order_statuses.csv', headers: true) do |row|
  OrderStatus.create(
    order_status: row['order_status']
  )
end

CSV.foreach('db/prefectures.csv', headers: true) do |row|
  Prefecture.create(
    prefecture: row['prefecture']
  )
end

CSV.foreach('db/second_categories.csv', headers: true) do |row|
  SecondCategory.create(
    first_category_id: row['first_category_id'],
    second_category:   row['second_category']
  )
end

CSV.foreach('db/sizes.csv', headers: true) do |row|
  Size.create(
    size_category_id: row['size_category_id'],
    size:             row['size']
  )
end

CSV.foreach('db/third_categories.csv', headers: true) do |row|
  ThirdCategory.create(
    second_category_id: row['second_category_id'],
    third_category:     row['third_category']
  )
end
