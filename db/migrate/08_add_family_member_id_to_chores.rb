class AddFamilyMemberIdToChores< ActiveRecord::Migration
  def change
    add_column :chores, :family_member_id, :integer
  end
end
