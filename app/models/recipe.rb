class Recipe < ActiveRecord::Base
  include FriendlyId
  friendly_id :title, :use => :slugged

  validates_presence_of :title, :description, :ingredients, :method

  belongs_to :meal_type
  belongs_to :user

  scope :recent, -> { order(updated_at: :desc) }
  scope :by_title, -> { order(title: :asc) }
  scope :by_title_desc, -> { order(title: :desc) }
end
