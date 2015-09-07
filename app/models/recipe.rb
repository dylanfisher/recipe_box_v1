class Recipe < ActiveRecord::Base
  include FriendlyId
  friendly_id :title, :use => :slugged

  validates_presence_of :title, :description, :ingredients, :method
end