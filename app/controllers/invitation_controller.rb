class InvitationController < ApplicationController  
  def show
    render json: Invitation.last
  end
end
