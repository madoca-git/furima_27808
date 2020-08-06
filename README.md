# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false, length: {minimum: 6}|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|

### Association
- has_many :items
- has_many :orders


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|name|string|null: false|
|explanation|text|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|delivary_fee_id|integer|null: false|
|delivary_form_id|integer|null: false|
|delivary_days_id|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_one :address
- has_one :order
- belongs_to :user


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|phone_number|string|null: false|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|municipalities|string|null: false|
|street|string|null: false|
|buildings|string||
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item