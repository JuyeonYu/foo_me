class AddPasswordToPost < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :password, :string
  end
end
