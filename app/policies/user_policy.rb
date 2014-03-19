class UserPolicy

    attr_reader :current_user, :user

    def initialize(current_user, user)
        @current_user = current_user
        @user = user
    end

    def new?
        current_user.admin?
    end

    def create?
        current_user.admin?
    end

    def edit?
        user.id == current_user.id || current_user.admin?
    end

    def update?
        user.id == current_user.id || current_user.admin?
    end

    def destroy?
        user.id == current_user.id || current_user.admin?     
    end

end