# README

## Teams

|Column |Type        |Options                        |
|-------|------------|-------------------------------|
|name   |string      |null: false                    |



### Association
has_many :Customers
has_many :User_teams
has_many :Programs

## users

|Column             |Type        |Options                        |
|-------------------|------------|-------------------------------|
|nickname           |string      |null: false                    |
|email              |string      |unique: true,null: false       |
|encrypted_password |string      |null: false                    |
|level              |integer     |null: false                    |
|team               |references  |null: false, foreign_key: true |


### Association
has_many :user_teams

## User_teams

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|user               |reference  |null: false, foreign_key: true |
|name               |reference  |null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :team


## Customers

|Column              |Type       |Options                        |
|--------------------|-----------|-------------------------------|
|name                |string     |null: false                    |
|name_kana           |string     |null: false                    |
|address             |string     |                               |
|phone_number        |string     |                               |
|fax_number          |string     |                               |
|explanation         |text       |                               |
|team                |reference  |null: false, foreign_key: true |


### Association
belongs_to :team
has_many :reserves

## Programs

|Column      |Type       |Options                        |
|------------|-----------|-------------------------------|
|name        |string     |null: false                    |
|date        |date       |null: false                    |
|number      |integer    |                               |
|ticket_rank |string     |                               |
|place       |string     |null: false                    |
|team        |references |null: false, foreign_key: true |


### Association
belongs_to :team
has_many :reserves

## Reserves

|Column    |Type       |Options                        |
|----------|-----------|-------------------------------|
|number    |integer    |null: false,unique: true       |
|program   |references |foreign_key: true              |
|customer  |references |foreign_key: true              |


### Association
belongs_to program
belongs_to customer