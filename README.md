# README

## Teams

|Column |Type        |Options                        |
|-------|------------|-------------------------------|
|name   |string      |null: false                    |



### Association
has_many :Customers
has_many :User_teams
has_many :Programs

## Users

|Column             |Type        |Options                        |
|-------------------|------------|-------------------------------|
|nickname           |string      |null: false,unique: true       |
|email              |string      |unique: true,null: false       |
|encrypted_password |string      |null: false,unique: true       |


### Association
has_many :user_teams

## User_teams

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|user               |reference  |null: false, foreign_key: true |
|team               |reference  |null: false, foreign_key: true |
|level_id           |integer    |null: false                    |

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

|Column         |Type       |Options                        |
|---------------|-----------|-------------------------------|
|name           |string     |null: false                    |
|number         |integer    |                               |
|place          |string     |null: false                    |
|team           |references |null: false, foreign_key: true |


### Association
belongs_to :team
has_many :reserves
has_many :schedules

## Reserves

|Column    |Type       |Options                        |
|----------|-----------|-------------------------------|
|number    |integer    |null: false,unique: true       |
|program   |references |foreign_key: true              |
|customer  |references |foreign_key: true              |


### Association
belongs_to program
belongs_to customer

## Messages

|Column    |Type       |Options                        |
|----------|-----------|-------------------------------|
|message   |text       |null: false                    |
|user      |references |foreign_key: true              |
|team      |references |foreign_key: true              |


### Association
belongs_to user
belongs_to team

## Schedules

|Column          |Type       |Options                        |
|----------------|-----------|-------------------------------|
|date            |date       |null: false                    |
|start_time      |time       |null: false                    |
|ticket_number   |integer    |null: false                    |
|program         |references |foreign_key: true              |


### Association
belongs_to team