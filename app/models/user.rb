class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  include ActiveRecordHelpers

  has_many :posts
  has_many :recommendations
  has_many :comments
  has_many :memberships

  has_many :users_skills, :dependent => :destroy # not need to preserve if user deleted
  has_many :skills, :through => :users_skills

  has_many :projects, :through => :memberships

  # TODO validation
  #validates :given_name, :family_name,
  #          presence: {message: 'You need to insert family name and given name'},
  #          unless: :omniauth?
  #
  #validates :tagline, length: {maximum: 255, message: 'Your tag line must have less then 255 characters'}
  #
  #def omniauth?
  #  uid && provider
  #end
end
