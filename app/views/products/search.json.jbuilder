json.array! @products do |product|
  json.id       product.id
  json.name     product.name
  json.image    asset_path product.images[0].image
  json.category product.category.name
  json.soldout  product.soldout
end