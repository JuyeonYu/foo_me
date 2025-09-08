class AddExpireTypeToPost < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :expire_type, :integer
  end
end
