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

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| password_confirmation| string | null: false |
| last name            | string | null: false |
| first name           | string | null: false |
| last name            | string | null: false |
| birth_date           | date   | null: false |Active Hash

### Association

- has_many :items
- has_one  :orders
- has_one  :addresses

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

| user       | references | null: false, foreign_key: true |
 image < active storage

### Association

- has_one :orders
- belongs_to :users

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | integer    | null: false                    |
| exp_month     | date       | null: false                    |Active Hash
| exp_year      | date       | null: false                    |Active Hash
| cvc           | date       | null: false                    |
| postal_code   | date       | null: false                    |
| prefecture    | integer    | null: false                    |Active Hash
| user          | references | null: false, foreign_key: true |
| items         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
