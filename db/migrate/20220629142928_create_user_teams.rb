class CreateUserTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :user_teams do |t|
      t.references :team, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :level_id, null: false, default: 0
      t.timestamps
    end
  end
end
