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
| birthday_date        | date   | null: false             |Active Hash

### Association

- has_many :items
- has_many :purchase_history

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
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


- has_one    :purchase_history
- belongs_to :user

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| addresses       | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| user            |references  | null: false, foreign_key: true |
| item            |references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history


## purchase_histories テーブル

| Column        | Type        | Options                        |
| ------------- | ----------  | ------------------------------ |
| user          | references  | null: false, foreign_key: true |
| item          | references  | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
- has_one    :order

