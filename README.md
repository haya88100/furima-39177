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

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| fast_name          | string | null: false               |
| last_name          | string | null: false               |
| fast_name_kana     | string | null: false               |
| last_name_kane     | string | null: false               |
| birthady           | date   | null: false               |
### Association
* has_many :items
* has_many :purchases

## items テーブル

| Column           | Type       | Options                           |
| ---------------- | ---------- | ----------------------------------|
| name             | string     | null: false, index: true          |
| memo             | text       | null: false                       |
| status_id        | integer    | null: false                       |
| chage_bearer_id  | integer    | null: false                       |
| shipping_area_id | integer    | null: false                       |
| delivary_day_id  | integer    | null: false                       |
| price            | integer    | null: false                       |
| user             | references | foreign_key: ture                 |
| category_id      | integer    | null: false,                      |

### Association
* belongs_to :user
* has_one :purchase
* has_many :item_images, dependent: :destroy

## item_images テーブル
| Column   | Type       | Options                        |
| ---------| ---------- | ------------------------------ |
| image    | string     | null: false                    |
| imege_id | references | null: false, foreign_key: true |

### Association
* belong_to :item

## user_addresses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_number       | string     | null: false                    |
| shipping_area_id  | integer    | null: false, dafault: 0        |
| city              | string     | null: false                    |
| house_number      | string     | null: false                    |
| build_name        | string     |                                |
| phone_number      | string     | null: false                    |
| purchases         | references | null: false, foregin_key: true |

### Association
* belongs_to :purchase

## purchases テーブル

| Column            | Type       | Options |
| ----------------- | ---------- | ------- |
| item              | references | null: false, foregin_key: true |
| user              | references | null: false, foregin_key: true |

### Association
belongs_to :user_address
