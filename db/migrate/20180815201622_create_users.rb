class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.datetime :created_on
      t.string :profile_picture
      t.string :bio
    end
  end
end
