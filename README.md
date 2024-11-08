# テーブル設計

ドロップダウンメニューは_id管理(integer型)を予定


## users テーブル
| Column             | Type             | Options     |
| ------------------ | ---------------- | ----------- |
| nickname           | string           | null: false |
| email              | string           | null: false, unique: true |
| encrypted_password | string           | null: false |
| last_name          | string           | null: false |
| first_name         | string           | null: false |
| last_name_k        | string           | null: false |   # カタカナ
| first_name_k       | string           | null: false |   # カタカナ
| date_of_birth      | date             | null: false |

### アソシエーション
- has_many :items
- has_many :statuses


## items テーブル
| Column             | Type             | Options     |
| ------------------ | ---------------- | ----------- |
| name               | string           | null: false |
| item_description   | text             | null: false |
| category_id        | integer          | null: false |   # カテゴリー
| condition_id       | integer          | null: false |   # 状態
| price              | integer          | null: false |
| shipping_fee_id    | integer          | null: false |   # 送料の有無
| shipping_day_id    | integer          | null: false |   # 配送までの日数
| region_id          | integer          | null: false |   # 地域(都道府県)
| user               | references       | null: false, foreign_key: true |

### アソシエーション
- belongs_to :user
- has_one :status

#### imageの保存
>アクティブストレージを1対1紐付け予定


## statuses テーブル
| Column             | Type             | Options     |
| ------------------ | ---------------- | ----------- |
| user               | references       | null: false, foreign_key: true |
| item               | references       | null: false, foreign_key: true |


### アソシエーション
- belongs_to :item
- belongs_to :user
- has_one :buyer

### 特筆事項
> このテーブルにレコードが存在していることが購入確定情報となる。


## buyers テーブル
| Column             | Type             | Options     |
| ------------------ | ---------------- | ----------- |
| post_code          | string           | null: false |
| region_id          | integer          | null: false |   # 地域(都道府県)
| city               | string           | null: false |
| street             | string           | null: false |
| room               | string           |
| phone_number       | string           | null: false |
| status             | references       | null: false, foreign_key: true |

### アソシエーション
- belongs_to :status