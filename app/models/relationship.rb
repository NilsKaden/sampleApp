class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
  # as of rails 5, these validations are no longer needed
  # i will leave them in for completeness' sake
  # and because i dont know why they arent needed
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  
  
end
