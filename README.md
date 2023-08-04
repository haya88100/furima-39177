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
| password           | string | null: false               |

### Association
* has_one :user_address, dependent: :destroy
* has_one :card, dependent: ;destroy
* has_many :items, dependent: :destroy, foreign_key: :items

## items テーブル

| Column        | Type    | Options                           |
| ------------- | ------- | ----------------------------------|
| name          | string  | null: false, index: true          |
| text          | text    | null: false                       |
| brand         | string  |                                   |
| status        | integer | null: false, dafault: 0           |
| chage_bearer  | integer | null: false, dafault: 0           |
| shipping_area | integer | null: false, dafault: 0           |
| delivary_days | integer | null: false, dafault: 0           |
| price         | integer | null: false                       |
| seller_id     | references | null: false, foreign_key: true |
| buyer_id      | references | foreign_key: ture              |
| category_id   | references | null: false, foreign_key: true |

### Association
* belongs_to :user
* belongs_to :category
* has_many :item_images, dependent: :destroy

## item_images テーブル
| Column   | Type       | Options                        |
| ---------| ---------- | ------------------------------ |
| image    | string     | null: false                    |
| imege_id | references | null: false, foreign_key: true |

### Association
* belong_to :item

## user_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| fast_name      | string     | null: false                    |
| last_name      | string     | null: false                    |
| fast_name_kana | string     | null: false                    |
| last_name_kane | string     | null: false                    |
| post_number    | string     | null: false                    |
| prefecture_id  | integer    | null: false, dafault: 0        |
| city           | string     | null: false                    |
| house_number   | integer    |                                |
| build_name     | string     |                                |
| phone_number   | string     |                                |
| user_id        | references | null: false, foregin_key: true |

### Association
* belongs_to :user

## purchases テーブル

| Column  | Type       | Options |
| ------- | ---------- | ------- |
| item_id | references |         |
| user_id | references |         |

### Association

## categorise テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association 
* has_many :items
* has_ancestry

## cards テーブル
| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| user_id | refrences | null: false, foreign_key: ture |
| card_id | string    | null: false                    |

### Association 
* belongs_to :user