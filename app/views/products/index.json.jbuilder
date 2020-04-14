json.products @products

json.array! Image.all do |image|
  json.image asset_path "#{image.image}"
end