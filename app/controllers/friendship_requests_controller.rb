class FriendshipRequestsController < ApplicationController
  def create
    request = FriendshipRequest.new(inviter_id: params[:inviter],
                                    invitee_id: params[:invitee],
                                    status: 'pending')

    if request.save
      redirect_to(User.find(params[:invitee]))
    else
      render(users_path)
    end
  end
end
