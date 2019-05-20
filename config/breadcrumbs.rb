crumb :root do
  link "メルカリ", root_path
end

crumb :item_show do |item|
  link item.name, item
  parent :root
end