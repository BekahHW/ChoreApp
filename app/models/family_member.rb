require 'pry'
class FamilyMember < ActiveRecord::Base
  has_many   :chores
  belongs_to :user

  # def slug
  #   name.strip.downcase.gsub /\W+/, '-'
  # end
  #
  # def self.find_by_slug(slug)
  #   self.all.find do |a|
  #
  #     a.slug == slug
  #   end
  # end
end
