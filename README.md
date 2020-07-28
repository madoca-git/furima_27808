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
|id|integer|null: false|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false, length: {minimum: 6}|
|last_name|string|null: false|
|first_name|string|null: false|
|last_namek|string|null: false|
|first_namek|string|null: false|
|birthday|date|null: false|
|phone_number|integer|null: false|
|postal_code|string|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|street|string|null: false|
|buildings|string||


### Association
- has_many :items
- has_many :comments


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|image|text|null: false|
|name|string|null: false|
|explanation|text|null: false|
|category|string|null: false|
|status|string|null: false|
|delivary_fee|string|null: false|
|delivery_form|string|null: false|
|delivery_days|string|null: false|
|price|integer|null: false, numericality: {greater_than: 300, less_than: 9,999,999}|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :comments
- belongs_to :user


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item