class Status < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :content, presence: true, length: { minimum: 10, message: "content is too short" }
  validates :title, presence: true, length: { :minimum => 8, message: "title is too short" }
  default_scope { order(created_at: :DESC) }
end
