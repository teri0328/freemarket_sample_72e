json.array! @products do |product|
  json.id       product.id
  json.name     product.name
  json.bland    product.bland.name
  json.image    asset_path product.images[0].filepath
  json.category product.category.name
  json.soldout  product.soldout
end