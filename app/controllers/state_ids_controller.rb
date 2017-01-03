class StateIdsController < ApplicationController
  # helper_method :validate_state_id

  def new 
    @state_id = StateId.new
  end

  def create
    @state_id = StateId.new(state_params)

    if @state_id.validate_params.empty?
      @state_id.save
      flash[:notice] = "New State ID Obtained"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "#{@state_id.validate_params.join(" ")}"
      redirect_to new_state_id_path
    end
  end



  def edit
    @state_id = StateId.find(params[:id])
  end

  def update 
    @state_id = StateId.find(params[:id])
      if (current_user.profile.name == state_params[:full_name]) && (current_user.current_state == current_user.profile.state) && (current_user.current_state == state_params[:state_id].to_i)
        @state_id.update(state_params)
        flash[:notice] = "Your State ID was Updated"
        redirect_to user_path(current_user)
      else
        flash[:notice] = "Unable to edit your ID - Your State and Profile name must match"
        redirect_to edit_state_id_path(current_user, @state_id)
      end
  end




  def state_params
    params.require(:state_id).permit(:state_id, :id, :user_id, :full_name)
  end
end
