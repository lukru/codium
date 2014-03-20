class MembershipPolicy
    attr_reader :current_user, :member

    def initialize(current_user, member)
        @current_user = current_user
        @member = member
    end

    def create?
        !current_user.admin?
    end

    def destroy?
        current_user.present?
    end

end