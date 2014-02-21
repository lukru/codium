User.delete_all
Post.delete_all

user = User.new
user.email = 'test@test.com'
user.password = user.password_confirmation = 'password'
user.given_name = 'Test'
user.family_name = 'Test'
user.save

user2 = User.new
user2.email = 'test2@test.com'
user2.password = user2.password_confirmation = 'password'
user2.given_name = 'Test1'
user2.family_name = 'Test1'
user2.save


post = Post.new
post.user = user
post.title = 'test post'
post.save