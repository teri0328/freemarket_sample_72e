## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|firstname            |string |null: false|
|lastname             |string |null: false|
|firstname_kana       |string |null: false|
|lastname_kana        |string |null: false|
|email                |string |null: false, unique: true|
|nickname             |string |null: false|
|birth_year           |integer|null: false|
|birth_month          |integer|null: false|
|birth_day            |integer|null: false|
|tel_number           |string |null: false, unique: true|
|password             |string |null: false|
|password_confirmation|string |null: false|
|encrypted_password   |string |null: false|

### Association
- has_many :products, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :evaluations, dependent: :destroy
- has_one  :address, dependent: :destroy

## Addressesテーブル
|Column     |Type      |Options|
|------|----|-------|
|user_id    |references|null: false, foreign_key: true|
|post_number|string    |null: false|
|prefecture |integer   |null: false|
|city       |string    |null: false|
|address    |string    |null: false|
|apartment  |integer   ||

### Association
- belongs_to: user

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
<!-- - has_many :categories, through: product_categories, dependent: :destroy -->
- belongs_to :category
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
<!-- - has_many :products, through: product_categories -->
- has_many :products

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

test