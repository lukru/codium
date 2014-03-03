class Project < ActiveRecord::Base

  has_many :members, :through => :memberships
  has_many :memberships  
end
