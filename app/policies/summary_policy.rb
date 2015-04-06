class SummaryPolicy < ApplicationPolicy

  def index?
    user.present?
  end

  def create?
    user.present? && user.admin?
  end

  def update?
    create?
  end

end

