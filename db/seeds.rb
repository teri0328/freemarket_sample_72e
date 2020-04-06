lady = Category.create(name: "レディース")

lady_tops = lady.children.create(name: "トップス")

lady_tops.children.create([{name: "Tシャツ"}, {name: "ジャケット"}, {name: "その他"}])