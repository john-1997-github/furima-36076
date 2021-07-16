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


 テーブル設計

## users テーブル

| Column               | Type   | Options                 |
| ------------------   | ------ | ----------------------  |
| nickname             | string | null: false             |
| email                | string | null: false unique true |
| encrypted_password   | string | null: false             |
| last name            | string | null: false             |
| first name           | string | null: false             |
| last name_kana       | string | null: false             |
| first_name_kana      | string | null: false             |
| birthday_year_id     | date   | null: false             |Active Hash
| birthday_month_id    | date   | null: false             |Active Hash
| birthday_date_id     | date   | null: false             |Active Hash

### Association

- has_many :items
- has_many :purchase_history

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | text       | null: false                    |
| info                   | text       | null: false                    |
| price                  | integer    | null: false                    |
| category_id            | integer    | null: false                    |Active Hash
| sales_status_id        | integer    | null: false                    |Active Hash
| shipping_fee_status_id | integer    | null: false                    |Active Hash
| prefecture_id          | integer    | null: false                    |Active Hash
| scheduled_delivery_id  | integer    | null: false                    |Active Hash
| user                   | references | null: false, foreign_key: true |
 image < active storage

### Association

- has_one    :orders
- has_one    :purchase_history
- has_one    :users

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |Active Hash
| city_id         | string     | null: false                    |Active Hash
| addresses_id    | string     | null: false                    |Active Hash
| building_id     | string     |                                |Active Hash
| phone_number_id | string     | null: false                    |Active Hash

### Association

- has_one    :purchase_history
- belongs_to :users
- belongs_to :items


## purchase_histories テーブル

| Column        | Type        | Options                        |
| ------------- | ----------  | ------------------------------ |
| user          | references  | null: false, foreign_key: true |
| item          | references  | null: false, foreign_key: true | 

### Association

- has_one :users
- has_one :items


