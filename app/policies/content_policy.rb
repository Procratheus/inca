class ContentPolicy < ApplicationPolicy

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def edit
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    user.present? && user.roles?
  end

  def import_all?
    user.present? && user.roles?
  end

  def import_delta?
    user.present? && user.roles?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
