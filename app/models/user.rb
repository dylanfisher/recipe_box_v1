class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :editor, :publisher, :admin]
  after_create :set_default_role, :if => :new_record?

  validates_presence_of :first_name, :last_name

  has_many :recipes

  def set_default_role
    self.role ||= :user
  end

end
