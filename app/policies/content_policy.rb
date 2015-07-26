class ContentPolicy < ApplicationPolicy

  def index?
    user.present?
  end

  def show?
    index?
  end

  def new?
    user.present?
  end

  def create?
    new?
  end

  def edit
    user.present?
  end

  def update?
    edit?
  end

  def destroy?
    user.present? && user.roles?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
