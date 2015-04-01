class PostPolicy < ApplicationPolicy

    class Scope
      attr_accessor :user, :scope
      def initialize(user,scope)
        @user = user
        @scope = scope
      end

      def resolve
        if !user.present?
          scope.none
        elsif (user.admin? || user.moderator?)
          scope.all
        else
          scope.where(user_id: user.id)
        end 
      end
                                                                    
    end

    def index?
      user.present?
    end

    def show?
      user.present? && (user.admin? || user.moderator?)
    end
end
