class RemoveTypeFromChores < ActiveRecord::Migration
  def change
    remove_column :chores, :type, :string
  end
end
