class Recipe < ActiveRecord::Base
  include FriendlyId
  friendly_id :title, :use => :slugged

  validates_presence_of :title, :description, :method

  belongs_to :meal_type
  belongs_to :user
  has_many :adjectives
  has_many :ingredients

  accepts_nested_attributes_for :adjectives, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  scope :recent, -> { order(updated_at: :desc) }
  scope :by_title, -> { order(title: :asc) }
  scope :by_title_desc, -> { order(title: :desc) }

  def next
    self.class.where("updated_at <= ? AND id != ?", updated_at, id).order("updated_at DESC").first
  end

  def previous
    self.class.unscoped.where("updated_at >= ? AND id != ?", updated_at, id).order("updated_at ASC").first
  end
end
