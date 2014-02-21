User.delete_all
Post.delete_all
Recommendation.delete_all

user = User.new
user.email = 'test@test.com'
user.password = user.password_confirmation = 'password'
user.save

user2 = User.new
user2.email = 'test2@test.com'
user2.password = user2.password_confirmation = 'password'
user2.save


post = Post.new
post.user = user
post.title = 'test post'
<<<<<<< HEAD
post.save

=======
post.save

recommendation = Recommendation.new
recommendation.user = user
recommendation.post = post
recommendation.save
>>>>>>> 2534adde8870035b649af52812d73ed62439d0ad
