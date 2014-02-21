class Post < ActiveRecord::Base
  belongs_to :user

  def word_count
  end

end
