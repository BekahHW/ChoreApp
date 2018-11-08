class AddUserIdToFamilyMembers< ActiveRecord::Migration
  def change
    add_column :family_member, :user_id, :integer
  end
end
