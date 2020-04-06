これはMASTERです
これはテストです

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
|post_number|string|null: false|
|adress|string|null: false|
|tel_number|string|null: false, unique: true|
|encrypted_password|string|null: false|

### Association
- has_many :products, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :evaluations, dependent: :destroy

## Productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|references|null: false, foreign_key: true|
|price|integer|null: false|
|postage|boolean|null: false, default: false|
|shipping_days|integer|null: false|
|region|string|null: false|
|condition_id|references|null: false, foreign_key: true|
|explanation|text|null: false|
|size|string||
|bland_id|references|foreign_key :true|
|category_id|references|foreign_key :true|

### Association
- belongs_to :user
- belongs_to :like
- belongs_to :bland
- belongs_to :evaluation
- has_many :conditions
- has_many :categories, through: product_categories, dependent: :destroy
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images

## Cardsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|references|null: false, foreign_key: true|
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
- has_many :products

## Product_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :category

## Product_blandsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|bland_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :bland

## Conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|name|string|null: false|

### Association
- belongs_to :product


## Evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## Likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|number|integer|null: false|

### Association
- belongs_to :user
- belongs_to :product

## Imagesテーブル

|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :product