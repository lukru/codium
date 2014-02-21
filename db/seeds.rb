User.delete_all
Post.delete_all
Recommendation.delete_all


user = User.new
user.email = 'test@test.com'
user.password = user.password_confirmation = 'password'
user.display_name = 'Test'
user.save

user2 = User.new
user2.email = 'test2@test.com'
user2.password = user2.password_confirmation = 'password'
user2.display_name = 'Test2'
user2.save


post = Post.new
post.user = user
post.title = 'test post'
post.save




recommendation = Recommendation.new
recommendation.user = user
recommendation.post = post
recommendation.save

