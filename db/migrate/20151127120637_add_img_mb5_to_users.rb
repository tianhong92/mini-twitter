class AddImgMb5ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :img_mb5, :string
  end
end

