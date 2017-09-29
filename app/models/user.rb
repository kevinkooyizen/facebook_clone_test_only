class User < ActiveRecord::Base
  has_secure_password
  has_many :likes, dependent: :destroy
  has_many :statuses, dependent: :destroy
  validates :name, presence: true
  validates :email, uniqueness: true, :presence => true, :format => { :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]{2,}+\z/ }
  validates :password, :presence => true, :length => { :minimum => 6, :maximum => 20 }
  validates :password_confirmation, :presence => true, :length => { :minimum => 6, :maximum => 20 }
end

