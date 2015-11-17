class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :name
      t.text :description
      t.boolean :is_an_admin
      t.boolean :is_a_manager

      t.timestamps null: false
    end
  end
end
