class ProjectPolicy
    attr_reader :current_user, :project

    def initialize(current_user, project)
        @current_user = current_user
        @project = project
    end

    def new?
        !current_user.admin?
    end

    def create?
        !current_user.admin?
    end

    def edit?
        project.members.include?(current_user)
    end

    def update?
        project.members.include?(current_user)
    end

    def destroy?
        project.members.include?(current_user) || current_user.admin?
    end
end