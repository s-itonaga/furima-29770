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

## user テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| nickname                    | string     | null: false                    |
| email                       | string     | null: false                    |
| password                    | string     | null: false                    |
| family_name                 | string     | null: false                    |
| name                        | string     | null: false                    |
| pronuciation_family_name    | string     | null: false                    |
| pronuciation_name           | string     | null: false                    |
| birth_date                  | date       | null: false                    |

### Association

- has_many :items
- has_many :order

## item テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| name                        | string     | null: false                    |
| comment                     | text       | null: false                    |
| category_id                 | integer    | null: false                    |
| status_id                   | integer    | null: false                    |
| delivery_fee_id             | integer    | null: false                    |
| prefectures_id              | integer    | null: false                    |
| delivery_days_id            | integer    | null: false                    |
| price                       | integer    | null: false                    |
| user                        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## order テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| user                       | references | null: false, foreign_key: true |
| item                       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery

## delivery テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| postal_code                | string     | null: false                    |
| prefecture_id              | integer    | null: false                    |
| city                       | string     | null: false                    |
| address                    | string     | null: false                    |
| building_name              | string     |                                |
| phone_number               | string     | null: false                    |
| order                      | references | null: false, foreign_key: true |

### Association

- belongs_to :order