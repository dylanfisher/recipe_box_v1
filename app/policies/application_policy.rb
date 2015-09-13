class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    admin?
  end

  def show?
    # scope.where(:id => record.id).exists?
    admin?
  end

  def create?
    admin?
  end

  def new?
    admin?
  end

  def update?
    admin?
  end

  def edit?
    admin?
  end

  def destroy?
    admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  private

  def admin?
    user.try(:role) == 'admin'
  end

  def publisher?
    admin? || user.try(:role) == 'publisher'
  end

  def editor?
    publisher? || user.try(:role) == 'editor'
  end

  def user?
    editor? || user.try(:role) == 'user'
  end

end
