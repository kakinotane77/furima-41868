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
| birth_date_year    | integer | null: false |
| birth_date_month   | integer | null: false |
| birth_date_day     | integer | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column                 | Type       | Options     |
|------------------------|------------|-------------|
| item_name              | string     | null: false |
| description            | text       | null: false |
| category               | string     | null: false |
| condition              | string     | null: false |
| shipping_fee_burden    | string     | null: false |
| shipping_form_location | string     | null: false |
| delivery_time          | string     | null: false |
| price                  | integer    | null: false |
| user_id                | references | null: false, foreign_key: true |

**備考**: 画像はActiveStorageで実装するため、データベースには含まれません。

### Association

- has_many :comments
- has_one :shipping_information
- belongs_to :user

## comments テーブル

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| content  | text       | null: false                    |
| item_id  | references | null: false, foreign_key: true |
| user_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shipping_informations テーブル

| Column                | Type       | Options                        |
|-----------------------|------------|--------------------------------|
| postal_code           | string     | null: false                    |
| prefecture            | string     | null: false                    |
| city_locality         | string     | null: false                    |
| address               | string     | null: false                    |
| building_name         | string     | null: false                    |
| phone_number          | string     | null: false                    |
| item_id               | references | null: false, foreign_key: true |

### Association

- belongs_to :item

**備考**: クレジットカード情報はデータベースには保存しません。