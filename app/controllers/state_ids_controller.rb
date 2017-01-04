class StateIdsController < ApplicationController
 
  def index
    @sids = StateId.all
  end

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

  def state_params
    params.require(:state_id).permit(:state_id, :id, :user_id, :full_name)
  end
end
