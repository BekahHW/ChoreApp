class FamilyMember < ActiveRecord::Base
  has_many   :chores
  belongs_to :user

  def slug
    username.strip.downcase.gsub /\W+/, '-'
  end

  def self.find_by_slug(slug)
    self.all.find{|a| a.slug == slug}
  end
end
