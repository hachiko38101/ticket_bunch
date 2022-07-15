class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :name_kana, null: false
      t.string :address
      t.string :phone_number
      t.string :fax_number
      t.string :email
      t.string :explanation
      t.references :team, null: false, foreign_key: true
      t.timestamps
    end
  end
end
