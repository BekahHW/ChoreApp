class AddUserIdToFamilyMembers< ActiveRecord::Migration
  def change
    add_column :family_members, :user_id, :integer
  end
end
