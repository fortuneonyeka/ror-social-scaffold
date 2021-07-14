class InvitationsController < ApplicationController
  def create
    invitation = Invitation.new(user_id: params[:user], friend_id: params[:friend], confirmed: false)
    if invitation.save
      redirect_to User.find(invitation.friend_id),
                  notice: 'Your friendship invitation was successfully sent.'
    else
      render
    end
  end

  def update
    invitation = Invitation.find(params[:id])
    user = User.find(invitation.user_id)
    invitation.confirmed = true
    if invitation.save
      redirect_to user, notice: "You are now friends with #{user.name}!"
    else
      render current_user
    end
  end

  def destroy
    invitation = Invitation.find(params[:id])
    invitation.destroy
    redirect_to current_user, notice: 'Invitation successfully rejected.'
  end
end
