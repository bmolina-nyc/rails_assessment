class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
    @profile.addresses.build(address_type: "Home")
    @profile.addresses.build
  end
 
  def create
    @profile = Profile.new(profile_params)

    if @profile.profile_valid?
       @profile.save 
      
      flash[:notice] = "Profile Created"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Must fill out all profile fields"
      redirect_to new_profile_path(current_user)
    end
  end

  def edit
    @profile = Profile.find_by(id: params[:id])
  end
 
  def update 
    @profile = Profile.find_by(id: params[:id])
    
     if @profile.params_valid?(profile_params) 
       @profile.update(profile_params)
      
      flash[:notice] = "Profile Updated"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Must fill out all profile fields"
      redirect_to edit_profile_path(current_user)
    end
  end

  private
 
  def profile_params
  params.require(:profile).permit(
    :name,
    :user_id,
    :state,
    addresses_attributes: [
      :street_address,
      :address_type
    ],
  )
end


end
