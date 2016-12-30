class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
    @profile.addresses.build(address_type: "Home")
  end
 
  def create
    if current_user.profile_valid?(profile_params) 
      current_user.profile = Profile.create(profile_params)
      
      flash[:notice] = "Profile Created"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Must fill out all fields"
      redirect_to new_profile_path(current_user)
    end
  end

  def edit
    @profile = Profile.find_by(id: params[:id])
  end
 
  def update 
    if current_user.profile_valid?(profile_params) 
      current_user.profile.update(profile_params)
      flash[:notice] = "Profile Updated"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Must fill out all fields"
      redirect_to edit_profile_path(current_user)
    end
  end

  private
 
  def profile_params
  params.require(:profile).permit(
    :name,
    :user_id,
    addresses_attributes: [
      :street_address,
      :state,
      :address_type
    ],
  )
end


end
