# README

# テーブル設計

## usersテーブル

| Column                       | Type    | Options                   |
| ---------------------------- | ------  | ------------------------- |
| nickname                     | string  | null: false               |
| email                        | string  | null: false, unique: true |
| password                     | string  | null: false               |
| family_name_kanji            | string  | null: false               |
| first_name_kanji             | string  | null: false               |
| family_name_kana             | string  | null: false               |
| first_name_kana              | string  | null: false               |
| birthday                     | date    | null: false               |

### Association
- has_many :items
- has_many :purchase_records


## itemsテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| item_text        | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_day_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase_record


## purchase_recordsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :delivery_address


## delivery_addressesテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| block_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_record
