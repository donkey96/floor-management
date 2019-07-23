# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|mail|string|null: false, unique: true|

### Association
- has_many :tables

## tablesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|user|reference|foreign_key: true|
|customer|reference||

### Association
- belongs_to :user
- belongs_to :customer

## customersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|tel|integer|null: false|
|time|integer|null: false|
|people|integer|null: false|
|text|text||


### Association
- has many :tables