class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.string :name, null: false
      t.string :place, null: false
      t.references :team, null: false, foreign_key: true
      t.timestamps
    end
  end
end