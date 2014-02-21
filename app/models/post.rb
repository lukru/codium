class Post < ActiveRecord::Base
  belongs_to :user


  def word_count
    count = Float(self.body.scan(/\w+/).size)
  end

  def reading_time
    minute = (word_count/250).round(1)
  end

  has_many :recommendations

  has_many :comments
  validates :title, presence: true


end
