class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end  

  def destroy?
    user == post.user
  end

  def update?
    if post.published == false
      user == post.user
    else
      false
    end
  end

  def edit?
    if post.published == false
      user == post.user
    else
      false
    end
  end

end
