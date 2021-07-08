module UserHelper
  def display_friendship_request(inviter: nil, invitee: nil)
    request = FriendshipRequest.where(
      ['inviter_id = ? and invitee_id = ?', inviter, invitee]
    )
    if request.empty?
      link_to('Send friendship request',
              friendship_requests_create_path(inviter: inviter,
                                              invitee: invitee),
              class: 'friendship-invitation')
    else
      content_tag(:span, request.first.status.capitalize, class: 'friendship-invitation')
    end
  end
end
