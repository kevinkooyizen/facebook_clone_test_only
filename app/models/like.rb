class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  validates :status_id, presence: true
  validates :user_id, presence: true
end
