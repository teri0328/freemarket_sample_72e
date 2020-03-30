## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|nickname|string|null: false, unique: true|
|furigana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|post_number|integer|null: false|
|adress|string|null: false|
|tel_number|string|null: false, unique: true|
|encrypted_password|string|null: false|

### Association
- has_many :products
- has_many :cards
- has_many :likes
- has_many :evalutions

## Productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null: false, foreign_key :true|
|price|integer|null: false|
|postage|boolean|null: false, default: false|
|shipping_days|integer|null: false|
|region|string|null: false|
|condition_id|string|null: false, foreign_key :true|
|explanation|text|null: false|
|size|string||

### Association
- belongs_to :user
- belongs_to :evalution
- has_many :conditions
- has_many :categories, through: product_categories
- has_many :blands, through: product_blands

## Cardsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|company|string|null: false|
|number|string|null: false|
|cord|string|null: false|
|year|integer|null: false|
|month|integer|null: false|

### Association
- belongs_to :user

## Categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products, through: product_categories

## Blandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :blands, through: product_blands

## Product_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :category

## Product_blandsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|bland_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :bland

## Conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|name|string|null: false|

### Association
- belongs_to :product


## Evalutionsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## Likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|number|integer|null: false|

### Association
- belongs_to :user