class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
    @profile.addresses.build(address_type: 'work')
    @profile.addresses.build(address_type: 'home')
  end
 
  def create
    current_user.profile = Profile.create(profile_params)
    flash[:notice] = "Profile Created"
    redirect_to user_path(current_user)
  end

  def edit
    @profile = Profile.find_by(id: params[:id])
  end
 
  def index
    @people = Profile.all
  end

  def update 
    current_user.profile.update({"name" => profile_params[:name]})
    current_user.profile.addresses.first.update(profile_params[:addresses_attributes]["0"])
    current_user.profile.addresses.last.update(profile_params[:addresses_attributes]["1"])
    flash[:notice] = "Profile Updated"
    redirect_to user_path(current_user)
  end

  private
 
  def profile_params
  params.require(:profile).permit(
    :name,
    addresses_attributes: [
      :street_address_1,
      :street_address_2,
      :city,
      :state,
      :zipcode,
      :address_type
    ]
  )
end


end
