class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :father_name
      t.date :birth_date
      t.string :login
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
