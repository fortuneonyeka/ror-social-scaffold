class FriendshipRequest < ApplicationRecord
  belongs_to :inviter, class_name: 'User'
  belongs_to :invitee, class_name: 'User'

  validates :status, inclusion: { in: %w[pending blocked] }
end
