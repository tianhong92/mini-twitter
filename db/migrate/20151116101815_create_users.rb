class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :crypted_password, limit: 128, default: '', null: false
      t.string :password_salt, limit: 128, default: '', null: false
      t.string :persistence_token
      t.integer :login_count, default: 0
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :last_login_ip
      t.timestamps null: false
    end
  end
end
