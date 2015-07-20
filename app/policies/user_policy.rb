class UserPolicy < ApplicationPolicy
  
  def index?
    admin?
  end

  def show?
    admin?
  end

  def edit?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  private

  def admin?
    user.roles == true    
  end
end
