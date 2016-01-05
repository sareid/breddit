class Recipe < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    recipe = Recipe.find_by (name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')) == slug
    recipe
  end

end