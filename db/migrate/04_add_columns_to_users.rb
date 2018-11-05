class AddColumnsToUsers< ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :password, :email, :string
  end
end
