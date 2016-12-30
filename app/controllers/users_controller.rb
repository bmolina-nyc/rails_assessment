class UsersController < ApplicationController
  
  def show
    @user = current_user
  end

  def update
    user = current_user
    state = State.find_by(id: params[:id])
    user.current_state = state.id
    user.states << state
    user.save
    redirect_to user_path(user)
  end


end
