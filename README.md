# テーブル設計

## users テーブル

| Column             | Type    | Options     |
|--------------------|---------|-------------|
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_date         | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                    | Type       | Options     |
|---------------------------|------------|-------------|
| item_name                 | string     | null: false |
| description               | text       | null: false |
| price                     | integer    | null: false |
| user                      | references | null: false, foreign_key: true|
| category_id               | integer    | null: false |
| condition_id              | integer    | null: false |
| shipping_fee_burden_id    | integer    | null: false |
| shipping_form_location_id | integer    | null: false |
| delivery_time_id          | integer    | null: false |

### Association

- has_one :order
- belongs_to :user

**備考**: 画像はActiveStorageで実装するため、データベースには含まれません。

## orders テーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column                    | Type       | Options     |
|---------------------------|------------|-------------|
| postal_code               | string     | null: false |
| city_locality             | string     | null: false |
| address                   | string     | null: false |
| building_name             | string     |             |
| phone_number              | string     | null: false |
| order                     | references | null: false, foreign_key: true |
| shipping_form_location_id | integer    | null: false |

### Association

- belongs_to :order

**備考**: クレジットカード情報はデータベースには保存しません。