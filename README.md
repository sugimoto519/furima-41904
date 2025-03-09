# README

# テーブル設計

## usersテーブル

| Column                | Type    | Options                   |
| --------------------- | ------  | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| password              | string  | null: false               |
| password_confirmation | string  | null: false               |
| name_kanji            | string  | null: false               |
| name_kana             | string  | null: false               |
| birthday              | integer | null: false               |

### Association
- has_many :items
- has_one  :buyer


## itemsテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_name | string     | null: false                    |
| item_text | text       | null: false                    |
| price     | integer    | null: false                    |
| user_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :buyer


## buyersテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| city          | string     | null: false                    |
| block_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
