class FamilyMember < ActiveRecord::Base
  has_many   :chores
  belongs_to :user
end
