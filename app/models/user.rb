class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :editor, :publisher, :admin]
  after_create :set_default_role, :if => :new_record?

  validates_presence_of :first_name, :last_name

  has_many :recipes

  def slug_candidates
    [
      :first_name,
      [:first_name, :last_name]
    ]
  end

  def set_default_role
    self.role ||= :user
  end

end
