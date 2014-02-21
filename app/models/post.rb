class Post < ActiveRecord::Base
  belongs_to :user


  has_many :recommendations

  has_many :comments
  validates :title, presence: true


end
