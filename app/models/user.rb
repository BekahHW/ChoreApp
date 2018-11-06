class User < ActiveRecord::Base
  has_secure_password
  has_many :family_members

  def slug
    username.strip.downcase.gsub /\W+/, '-'
  end

  def self.find_by_slug(slug)
    self.all.find{|a| a.slug == slug}
  end

end
