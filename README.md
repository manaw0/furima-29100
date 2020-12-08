# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| name          | string     | null: false                     |
| image         | string     | null: false                     |
| contet        | text       | null: false                     |
| price         | integer    | null: false                     |
| category      | string     | null: false                     |
| status        | string     | null: false                     |
| shipping_fee  | string     | null: false                     |
| prefecture    | string     | null: false                     |
| shipping_days | string     | null: false                     |
| user          | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase
  has_one :shipping_address

## shipping_address テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| postal_code   | integer    | null: false |
| municipality  | string     | null: false |
| address       | string     | null: false |
| building_name | string     | null: false |
| phone_number  | integer    | null: false |

### Association

- belongs_to :purchases

