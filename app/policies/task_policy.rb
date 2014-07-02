class TaskPolicy
  attr_reader :user, :task

  def initialize(user, task)
    @user, @task = user, task
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
