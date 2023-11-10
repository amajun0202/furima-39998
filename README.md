# テーブル設計

## users テーブル

| Column                    | Type   | Options                |
| ------------------------- | ------ | ---------------------- |
| nickname                  | string | NOT NULL               |
| e-mail                    | string | NOT NULL, ユニーク制約  |
| encrypted_password        | string | NOT NULL, チェック制約  |
| first_name                | string | NOT NULL               |
| last_name                 | string | NOT NULL               |
| first_name_kana           | string | NOT NULL               |
| last_name_kana            | string | NOT NULL               |
| birthdate_id              | integer| NOT NULL               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                    | Type       | Options                |
| ------------------------- | ---------- | ---------------------- |
| item_image                | text       | NOT NULL               |
| item_name                 | string     | NOT NULL               |
| description               | text       | NOT NULL               |
| category_id               | integer    | NOT NULL               |
| condition_id              | integer    | NOT NULL               |
| shipping_cost_id          | integer    | NOT NULL               |
| origin_region_id          | integer    | NOT NULL               |
| shipping_days_id          | integer    | NOT NULL               |
| cost                      | integer    | NOT NULL               |
| commission                | integer    | NOT NULL               |
| profit                    | integer    | NOT NULL               |
| user                      | references | NOT NULL , 外部キー     |

### Association

- belongs_to :users
- has_many :orders


## orders テーブル

| Column                    | Type       | Options                |
| ------------------------- | ---------- | ---------------------- |
| postal_code               | integer    | NOT NULL, チェック制約  |
| prefecture_id             | integer    | NOT NULL               |
| city                      | string     | NOT NULL               |
| street_number             | string     | NOT NULL               |
| building_name             | string     |                        |
| phone_number              | integer    | NOT NULL, チェック制約  |
| user                      | references | NOT NULL , 外部キー     |
| item                      | references | NOT NULL , 外部キー     |

### Association

- belongs_to :users
- belongs_to :items